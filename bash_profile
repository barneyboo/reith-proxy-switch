# Paste the following in your ~/.bash_profile
# replacing your existing http_proxy and https_proxy variables

ssid=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`;
l=${#ssid}

# corporate wifi: use proxy
if [[ $ssid == *"Corporate"* ]]; then
   export http_proxy=http://www-cache.reith.bbc.co.uk:80/
   export https_proxy=http://www-cache.reith.bbc.co.uk:80/
# wired: use proxy
elif [[ $l == 0 ]]; then
   export http_proxy=http://www-cache.reith.bbc.co.uk:80/
   export https_proxy=http://www-cache.reith.bbc.co.uk:80/
# staff wifi: no proxy
elif [[ $ssid == *"Staff Wi-Fi"* ]]; then 
    unset http_proxy
    unset https_proxy
# something else: WFH?
else
    unset http_proxy
    unset https_proxy
fi
