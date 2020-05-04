function fn() {
    var config = {
        host : 'http://localhost:3000'
    };

    if (karate.env) {
        karate.log("Environment set: env = ", karate.env);

        if (karate.env === 'prod') {
            config.host = 'http://impos.com:4000'
        }

    } else {
        karate.log("Using default profile settings");
    }
    karate.log("Application in test url: ", config.host);

    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    return config;
}