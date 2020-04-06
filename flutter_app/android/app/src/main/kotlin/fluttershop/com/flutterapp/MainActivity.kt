package fluttershop.com.flutterapp

import android.graphics.BitmapFactory
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.graphics.Bitmap
import java.io.ByteArrayOutputStream


private const val CHANNEL_ROUTER = "com.meetyou.flutter/native_image"
class MainActivity: FlutterActivity() {
    private val mContext: Context? = this


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(this.flutterView, CHANNEL_ROUTER).setMethodCallHandler { call, result ->
            

            val drawableId: Int = mContext?.resources!!.getIdentifier(call.arguments.toString(), "drawable", mContext?.packageName)
            val bitmap = BitmapFactory.decodeResource(mContext?.resources, drawableId)
            var baos = ByteArrayOutputStream()
            
            bitmap.compress((Bitmap.CompressFormat.PNG),100,baos)
            result.success(baos.toByteArray())

        }

    }

}
