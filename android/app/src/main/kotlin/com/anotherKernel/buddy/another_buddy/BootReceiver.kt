package com.anotherKernel.buddy.another_buddy

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.util.Log
import com.fasterxml.jackson.databind.ObjectMapper
import java.io.DataOutputStream
import java.io.IOException


class BootReceiver : BroadcastReceiver() {

  companion object {
    private val TAG = "Another BootReceiver"
  }

  private lateinit var prefs: SharedPreferences

  private val suShell by lazy {
    Runtime.getRuntime().exec("su")
  }
  private val suOutputStream by lazy {
    DataOutputStream(suShell.outputStream)
  }

  override fun onReceive(context: Context, intent: Intent) {
    Log.i(TAG, "received intent with action: ${intent.action}")
    if (intent.action == Intent.ACTION_BOOT_COMPLETED) {
      initPrefs(context)
      val prefsJson = prefs.getString("flutter.tunableSettings", "");
      Log.i(TAG, "prefsJson was read: $prefsJson")
      if (!prefsJson.isNullOrEmpty()) {
        val parsedJson = ObjectMapper().readValue(prefsJson, HashMap::class.java)

        if (parsedJson.isNotEmpty()) {
          AnotherNotificationManager().startTimerNotification(context, 10) {
            Log.i(TAG, "parsed JSON: $parsedJson")
            for (entry in parsedJson) {
              Log.i(TAG, "Setting tunable ${entry.key} to value ${entry.value}")
              applyTunable(entry)
            }
            flushShell()
            true
          }
        }
      }
    }
  }

  private fun initPrefs(context: Context) {
    prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
  }

  private fun flushShell() {
    try {
      suOutputStream.writeBytes("exit\n")
      suOutputStream.flush()
      suShell.waitFor()
    } catch (e: IOException) {
      throw Exception(e)
    } catch (e: InterruptedException) {
      throw Exception(e)
    }
  }

  private fun applyTunable(entry: MutableMap.MutableEntry<*, *>) {
    val tunableFile = entry.key as String
    val value = entry.value
    try {
      suOutputStream.apply {
        writeBytes("echo \"$value\" > $tunableFile\n")
        flush()
      }
    } catch (e: IOException) {
      throw Exception(e)
    } catch (e: InterruptedException) {
      throw Exception(e)
    }
  }
}