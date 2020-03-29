package com.impos.utils;

import java.util.Base64;
import java.util.stream.Stream;

public class Base64Encoder {
    public static String encode(String... args) {
        byte[] stringToEncode = Stream.of(args)
                .reduce(String::join)
                .map(String::getBytes)
                .orElse(new byte[] {});
        return Base64.getEncoder().encodeToString(stringToEncode);
    }

}
