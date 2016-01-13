(defproject greglook/riemann-config "0.1.0-SNAPSHOT"
  :description "Riemann stream configuration rules."
  :url "https://github.com/greglook/riemann-config"

  :aliases {"test-config" ["run" "-m" "riemann.bin" "test" "config.clj"]}

  :dependencies
  [[org.clojure/clojure "1.7.0"]
   [riemann "0.2.10"]])
