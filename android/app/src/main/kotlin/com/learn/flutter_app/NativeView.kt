package com.learn.flutter_app

import android.content.Context
import android.graphics.Color
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView


internal class NativeView(context: Context?, id: Int, creationParams: Map<String?,Any?>?) : PlatformView {
private val textView: Button

    override fun getView(): View {
       return textView
    }

    override fun dispose() {

    }

    init {

        textView = Button(context)

        textView.setPadding(10,10,10,10)
        textView.textSize = 16f
//        textView.setTextColor(Color.WHITE)
//        textView.setBackgroundColor(Color.BLUE)

        textView.text = "Android Button"

    }
}