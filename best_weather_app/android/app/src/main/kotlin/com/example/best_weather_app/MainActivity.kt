package com.example.best_weather_app

import android.os.AsyncTask
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    companion object {
        private const val CHANNEL = "com.idunnololz.best_weather_app/weather"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        call, result ->
            // This method is invoked on the main thread.
            // TODO

            FetchWeatherAsyncTask {
                result.success(it)
            }.execute()
        }
    }
}

class FetchWeatherAsyncTask(
    private val callback: (String) -> Unit
) : AsyncTask<Void, Void, String>() {

    companion object {
        private var currentTemp = -40 + Math.random() * 80
    }

    override fun doInBackground(vararg p0: Void?): String {
        Thread.sleep((Math.random() * 5000 + 2000).toLong())

        currentTemp += Math.random() * 1

        return """
            {
              "location": "Norway",
              "condition": "Hail",
              "temperature": ${currentTemp}
            }
        """.trimIndent()
    }

    override fun onPostExecute(result: String?) {
        super.onPostExecute(result)
        if (result != null) {
            callback(result)
        }
    }
}
