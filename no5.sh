awk '(/cron/ || /CRON/) && (!/sudo/) && (NF < 13) {print}' /var/log/syslog >> /home/salsha/sisop/no5.log
