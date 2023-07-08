package com.anotherKernel.buddy.another_buddy

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

/*
 * Created by Shripal Jain
 * on 07/07/2023
 */

class AnotherNotificationManager : BroadcastReceiver() {

  companion object {
    private val CHANNEL_ID = "timer"
    private val TIMER_ID = 159
    private val COMPLETED_ID = 250

    private val NOTIF_TIMER_TITLE = "Another Kernel Manager: Auto-set on boot"
    private val NOTIF_TIMER_CONTENT = "Your saved settings will be applied in %d seconds"

    private val NOTIF_COMPLETED_SUCCESS_TITLE = "Another Kernel Manager: Settings applied"
    private val NOTIF_COMPLETED_SUCCESS_CONTENT = "Your saved settings were applied successfully"

    private val NOTIF_COMPLETED_FAILED_TITLE = "Another Kernel Manager: Settings application failed"
    private val NOTIF_COMPLETED_FAILED_CONTENT = "Your saved settings could not be applied successfully"

    private val INTENT_ACTION_CANCEL = "${BuildConfig.APPLICATION_ID}.cancel"

    private var notificationJob: Job? = null
  }

  private lateinit var context: Context

  private val notificationManager by lazy {
    context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
  }

  private val notificationBuilder by lazy { NotificationCompat.Builder(context, CHANNEL_ID) }

  fun startTimerNotification(context: Context, seconds: Int, apply: () -> Boolean) {
    this.context = context
    createNotificationChannel()
    val cancelIntent = Intent(context, AnotherNotificationManager::class.java).apply {
      action = INTENT_ACTION_CANCEL
    }
    val cancelPendingIntent: PendingIntent =
      PendingIntent.getBroadcast(context, 100, cancelIntent, PendingIntent.FLAG_IMMUTABLE)
    notificationBuilder.apply {
      setSmallIcon(R.drawable.ic_notification)
      setContentTitle(NOTIF_TIMER_TITLE)
      setOngoing(true)
      addAction(NotificationCompat.Action.Builder(R.drawable.ic_notification, "Cancel", cancelPendingIntent).build())
    }
    updateNotificationProgress(seconds, seconds)

    notificationJob = GlobalScope.launch() {
      for (second in seconds downTo 0) {
        updateNotificationProgress(seconds, second)
        delay(1000)
      }
      with(NotificationManagerCompat.from(context)) {
        cancel(TIMER_ID)
      }
      showCompletedNotification(apply)
    }
  }

  private fun showCompletedNotification(apply: () -> Boolean) {
    notificationBuilder.apply {
      setProgress(0, 0, false)
      if (apply()) {
        setContentTitle(NOTIF_COMPLETED_SUCCESS_TITLE)
        setContentText(NOTIF_COMPLETED_SUCCESS_CONTENT)
      } else {
        setContentTitle(NOTIF_COMPLETED_FAILED_TITLE)
        setContentText(NOTIF_COMPLETED_FAILED_CONTENT)
      }
      setOngoing(false)
      setAutoCancel(true)
      clearActions()
    }
    with(NotificationManagerCompat.from(context)) {
      notify(COMPLETED_ID, notificationBuilder.build())
    }
  }

  private fun updateNotificationProgress(maxSeconds: Int, progress: Int) {
    notificationBuilder.apply {
      setProgress(maxSeconds, progress, false)
      setContentText(String.format(NOTIF_TIMER_CONTENT, progress))
    }
    with(NotificationManagerCompat.from(context)) {
      notify(TIMER_ID, notificationBuilder.build())
    }
  }

  private fun createNotificationChannel() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      val notificationChannel =
        NotificationChannel(CHANNEL_ID, "Set on boot", NotificationManager.IMPORTANCE_LOW)
      notificationManager.createNotificationChannel(notificationChannel)
    }
  }

  override fun onReceive(context: Context?, intent: Intent?) {
    context?.let {
      if (intent?.action == INTENT_ACTION_CANCEL) {
        this.context = context
        Log.d("AnotherNotifManager", "CANCELLING....")
        notificationJob?.cancel()

        with(NotificationManagerCompat.from(context)) {
          cancel(TIMER_ID)
        }
      }
    }
  }
}