package org.andersonsinaluisa.demobaze_api;

import com.intuit.karate.junit5.Karate;

public class UserTest {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:karate/registration-login.feature");
    }
}