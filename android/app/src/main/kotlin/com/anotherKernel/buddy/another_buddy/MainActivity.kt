package com.anotherKernel.buddy.another_buddy

import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import androidx.core.app.NotificationCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    context.registerReceiver(BootReceiver(), IntentFilter(Intent.ACTION_BOOT_COMPLETED))
  }
}
