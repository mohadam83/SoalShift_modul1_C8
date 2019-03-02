awk '(tolower($0) ~ /cron/) && (tolower($0) !~ /sudo/) && (NF < 13) {print}' /var/log/syslog >> /home/adam/SoalShift_modul1_C8/no5.log
