(defproject benchmark "0.1.0-SNAPSHOT"
  :description "benchmark: Various micro-benchmarks to compare different programming languages"
  :url "http://example.com/FIXME"
  :license {:name "BSD"
            :url ""}
  :dependencies [[org.clojure/clojure "1.8.0"]]
  :main ^:skip-aot benchmark.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
  ;:certificates ["ZscalerRootCertificate-2048-SHA256.crt"])
