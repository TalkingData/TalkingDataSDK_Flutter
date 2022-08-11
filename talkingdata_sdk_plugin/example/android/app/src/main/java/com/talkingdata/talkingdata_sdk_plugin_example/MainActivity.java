package com.talkingdata.talkingdata_sdk_plugin_example;

import android.os.Bundle;

import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        com.talkingdata.talkingdata_sdk_plugin.TalkingDataSDKPlugin.setContext(this);
    }
}
