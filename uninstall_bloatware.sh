#!/bin/bash

# List of package names to uninstall (bloatware)
packages_to_uninstall=(
    com.android.bips
    com.android.bookmarkprovider
    com.android.cellbroadcastreceiver
    com.android.cellbroadcastreceiver.overlay.common
    com.android.chrome
    com.android.eggcom.android.mms.service
    com.android.printspooler
    com.android.providers.calendar
    com.android.providers.partnerbookmarks
    com.android.providers.userdictionary
    com.android.vpndialogs
    com.android.wallpaper.livepicker
    com.android.wallpaperbackup
    com.android.wallpapercropper
    com.dsi.ant.server
    com.caf.fmradio
    com.coloros.aftersalesservice
    com.coloros.alarmclock
    com.coloros.assistantscreencom.coloros.backuprestoree
    com.coloros.backuprestore.remoteservice
    com.coloros.calculatorr
    com.coloros.childrenspace
    com.coloros.cloud
    com.coloros.compass2
    com.coloros.filemanager
    com.coloros.floatassistant
    com.coloros.focusmode
    com.coloros.gallery3d
    com.coloros.gamespace
    com.coloros.healthcheck
    com.coloros.healthservice
    com.coloros.musiclink
    com.coloros.safesdkproxy
    com.coloros.screenrecorder
    com.coloros.securepay
    com.coloros.smartsidebar
    com.coloros.speechassist
    com.coloros.translate.engine 
    com.coloros.video
    com.coloros.wallpapers
    #com.coloros.weather.service (suspicious)
    com.coloros.widget.smallweather
    com.coloros.soundrecorder
    com.google.android.apps.googleassistant
    com.google.android.apps.maps
    com.google.android.apps.messaging
    com.google.android.apps.nbu.files
    com.google.android.apps.nbu.paisa.user
    com.google.android.apps.photos
    com.google.android.apps.wellbeing
    com.finshell.fin
    com.coloros.oshare
    com.android.contacts
    com.android.incallui
    com.google.android.apps.tachyon
    com.coloros.operationtips
    com.heytap.market
    com.android.mms
    com.coloros.onekeylockscreen
    com.coloros.oppomultiapp
    com.coloros.weather2
    com.nearme.gamecenter
    com.coloros.calculator
    com.google.mainline.telemetry
    com.heytap.cast
    com.google.android.apps.youtube.music
    com.google.android.youtube.tvmusic
    com.google.android.videos
    com.google.android.calendar
    com.google.android.documentsui
    com.google.android.feedback
    com.google.android.gm
    com.google.android.googlequicksearchbox
    com.google.android.apps.docs
    com.coloros.smartdrive
    com.google.android.keep
    com.google.android.marvin.talkback
    com.google.android.projection.gearhead
    com.google.android.tag
    com.google.android.tts
    com.coloros.assistantscreen
    com.google.android.apps.restore
    com.google.android.apps.work.oobconfig
    com.coloros.encryption
    com.google.android.accessibility.soundamplifier
    com.google.android.setupwizard
    com.coloros.logkit
    com.google.android.youtube
    com.google.ar.core
    com.google.ar.lens
    com.heytap.browser
    com.heytap.cloud
    com.heytap.datamigration
    com.heytap.habit.analysis
    com.heytap.openid
    com.heytap.pictorial
    com.heytap.themestore
    com.facebook.appmanager
    com.facebook.services
    com.facebook.system
    com.nearme.atlas
    com.nearme.statistics.rom
    com.netflix.mediaclient
    com.netflix.partner.activation
    com.opera.preinstall
    com.redteamobile.roaming
    com.redteamobile.roaming.deamon
    com.tencent.soter.soterserver
    com.oppo.atlas
    com.oppo.gestureservice
    com.oppo.gmail.overlay
    com.oppo.market
    com.app.market
    com.oppo.music
    com.oppo.operationmanual
    com.oppo.partnerbrowsercustomizations
    com.oppo.quicksearchbox
    com.oppo.tzupdate
    com.oppo.usercenter
    com.oppoex.afterservice
    com.coloros.sau
    com.coloros.sauhelper
    com.oppo.otaui
    com.oppo.ota
    com.mediatek.gnssdebugreport 
    com.mediatek.mdmlsample
    com.trustonic.teeservice
    se.dirac.acs
    com.coloros.backuprestore
    com.coloros.apprecover
    com.coloros.karaoke
    com.heytap.music
    com.coloros.activation
    com.coloros.activation.overlay.common
    com.coloros.appmanager
    com.coloros.athena
    com.coloros.avastofferwall
    com.coloros.bootreg
    com.coloros.gamespaceui
    com.coloros.ocrscanner
    com.coloros.phonemanager
    com.coloros.phonenoareainquire
    com.coloros.pictorial
    com.coloros.resmonitor
    com.coloros.sceneservice
    com.coloros.translate.engine
    com.coloros.wallet
    com.coloros.wifibackuprestore
    com.nearme.browser
    com.nearme.themestore
    com.oppo.aod
    com.oppo.bttestmode
    com.oppo.criticallog
    com.oppo.lfeh
    com.oppo.logkit
    com.oppo.mimosiso
    com.oppo.nw
    com.oppo.operationManual
    com.oppo.ovoicemanager
    com.oppo.qualityprotect
    com.oppo.rftoolkit
    com.oppo.ScoreAppMonitor
    com.oppo.sos
    com.oppo.startlogkit
    com.oppo.usageDump
    com.oppo.webview
    com.oppo.wifirf
)
for package in "${packages_to_uninstall[@]}"; do
  echo "Uninstalling package: $package"
  pm uninstall "$package"
  pm uninstall --user 0 "$package"
  result=$?
  
  if [ $result -eq 0 ]; then
    echo "Package uninstalled successfully."
  elif [ $result -eq 1 ]; then
    if pm list packages | grep -q "$package"; then
      echo "Unable to delete. Disabling package instead."
      pm disable-user --user 0 "$package"
    else
      echo "Package not found or already uninstalled. Proceeding to the next package."
    fi
  else
    echo "Failed to uninstall the package."
  fi
done
## Other Variations:-

# for package in "${packages_to_uninstall[@]}"; do
#   pm uninstall --user 0 "$package"
#   echo "Uninstalling package: $package"
# done

# for package in "${packages_to_uninstall[@]}"; do
#   echo -n "Do you want to uninstall $package? (Type 'ok' to confirm): "
#   read confirmation
#   if [ "$confirmation" = "ok" ]; then
#     pm uninstall --user 0 "$package"
#   else
#     echo "Skipped $package"
#   fi
# done