package com.example.cypher;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;


public class CypherPlugin implements FlutterPlugin, MethodCallHandler {
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "cypher");
        channel.setMethodCallHandler(this);
    }

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "cypher");
        channel.setMethodCallHandler(new CypherPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getPassword")) {

            int length = call.argument("length");
            boolean digits = call.argument("digits");
            boolean lowers = call.argument("lowers");
            boolean uppers = call.argument("uppers");
            boolean punctuations = call.argument("punctuations");

            PasswordGenerator passwordGenerator = new PasswordGenerator.PasswordGeneratorBuilder()
                    .useDigits(digits)
                    .useLower(lowers)
                    .useUpper(uppers)
                    .usePunctuation(punctuations)
                    .build();
            String password = passwordGenerator.generate(length);

            result.success(password);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
