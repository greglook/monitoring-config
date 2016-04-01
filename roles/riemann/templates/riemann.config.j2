; Main entry point for Riemann rules. The code here is evaluated in
; the `riemann.config` namespace when it is loaded.

#_
(require
  '[gslook.riemann.common :refer [env]]
  :reload-all)


(def config-dir "/usr/local/etc/riemann/")


; Log output to a file.
(logging/init {:file "/var/log/riemann/riemann.log"})
(logging/set-level "riemann.transport.tcp" org.apache.log4j.Level/INFO)
(logging/set-level "riemann.transport.udp" org.apache.log4j.Level/INFO)


; Accept metrics via TCP and UDP on all interfaces.
(udp-server :host "0.0.0.0" :port 5555 :max-size 65535)
(tcp-server :host "0.0.0.0" :port 5555)

(ws-server  :host "0.0.0.0" :port 5556)

(comment
  "TODO: switch to TLS-protected connections once certs are set up"

  ; Set up a TLS-protected port for secure metrics. The key can be generated with
  ; the following command:
  ;     openssl pkcs8 -topk8 -nocrypt -in $tls_key -out $pkcs8_key
  (tcp-server :host "0.0.0.0"
              :port 5554
              :tls? true
              :key     (str config-dir "tls-key.pkcs8")
              :cert    (str config-dir "riemann.home.gslook.net.crt")
              :ca-cert (str config-dir "gslook-ca.crt"))

  ; Serve websockets on the local interface only, so it can be proxied by Nginx.
  (ws-server :host "127.0.0.1" :port 5557))


; Sweep the index for expired events every N seconds.
(periodically-expire 10)


(let [index (default {:ttl 300} (index)) ]
  (streams
    ; For now, just record things to the index.
    index))
