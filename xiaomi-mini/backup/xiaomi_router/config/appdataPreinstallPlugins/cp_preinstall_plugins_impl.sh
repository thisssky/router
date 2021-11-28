#!/bin/sh
cp_appinfo_package() 
{
  mkdir -p $DEST_PATH/$2
  cp -rfp $SOURCE_PATH/$1/app_infos/$2.manifest $DEST_PATH/app_infos/
}

vercomp () {
    if [ "$1" = "$2" ]
    then
        return 0
    fi

    local first second
    first=`echo $1 | grep -o '^[0-9]*\.' | grep -o '[0-9]*'`
    second=`echo $2 | grep -o '^[0-9]*\.' | grep -o '[0-9]*'`
    if [ -z "$first" ]
    then
      first=0
    fi
    if [ -z "$second" ]
    then
      second=0
    fi
    if [ $first -gt $second ]
    then
      return 1
    fi
    if [ $first -lt $second ]
    then
      return 2
    fi

    first=`echo $1 | grep -o '\.[0-9]*' | grep -o -m 1 '[0-9]*'`
    second=`echo $2 | grep -o '\.[0-9]*' | grep -o -m 1 '[0-9]*'`
    if [ -z "$first" ]
    then
      first=0
    fi
    if [ -z "$second" ]
    then
      second=0
    fi
    if [ $first -gt $second ]
    then
      return 1
    fi
    if [ $first -lt $second ]
    then
      return 2
    fi

    first=`echo $1 | grep -o '\.[0-9]*\.[0-9]*$' | grep -o '\.[0-9]*$' | grep -o '[0-9]*'`
    second=`echo $2 | grep -o '\.[0-9]*\.[0-9]*$' | grep -o '\.[0-9]*$' | grep -o '[0-9]*'`
    if [ -z "$first" ]
    then
      first=0
    fi
    if [ -z "$second" ]
    then
      second=0
    fi

    if [ $first -gt $second ]
    then
      return 1
    fi
    if [ $first -lt $second ]
    then
      return 2
    fi

    return 0
}


start() {
  mkdir -p $DEST_PATH/app_infos

  for i in `ls $SOURCE_PATH/notuninstallable/app_infos`
  do
    status=
    appid=`echo $i | grep -o "[0-9]*"`
    manifest=$appid.manifest
    if [ -f $DEST_PATH/app_infos/$manifest ] 
    then
      status=`grep "^status" $DEST_PATH/app_infos/$manifest | grep -o "[0-9]*"`
    fi

    versionNew=`grep "^version" $DEST_PATH/app_infos/$manifest | grep -o "[0-9]*\.[0-9]*\.[0-9]*"`
    versionOld=`grep "^version" $SOURCE_PATH/notuninstallable/app_infos/$manifest | grep -o "[0-9]*\.[0-9]*\.[0-9]*"`
    vercomp "$versionOld" "$versionNew"
    result=$?
    if [ "$result" = "1" ]
    then
      echo "old version is large than new"
      cp_appinfo_package notuninstallable $appid

      if [ -n "$status" ]
      then
        sed -i '/^status/s/\"[0-9]*\"/\"'$status'\"/g' $DEST_PATH/app_infos/$manifest
      fi

      if [ -d  $SOURCE_PATH/notuninstallable/$appid ]
      then
        cp -rfp $SOURCE_PATH/notuninstallable/$appid $DEST_PATH/
      fi

      if [ "$appid"x = "2882303761517281003"x ]
      then
        mkdir -p $DEST_PATH/$appid/etc/
        touch $DEST_PATH/$appid/etc/manifest
      fi

    fi
  done

  for i in `ls $SOURCE_PATH/uninstallable/app_infos`
  do
    appid=`echo $i | grep -o "[0-9]*"`
    manifest=$appid.manifest

    if [ ! -f $DEST_PATH/$appid.flashed ]
    then
      touch $DEST_PATH/$appid.flashed
      cp_appinfo_package uninstallable $appid
      if [ -d  $SOURCE_PATH/uninstallable/$appid ]
      then
        cp -rfp $SOURCE_PATH/uninstallable/$appid $DEST_PATH/
      fi
    elif [ -f $DEST_PATH/app_infos/$manifest ] 
    then

      status=`grep "^status" $DEST_PATH/app_infos/$manifest | grep -o "[0-9]*"` 
      versionNew=`grep "^version" $DEST_PATH/app_infos/$manifest | grep -o "[0-9]*\.[0-9]*\.[0-9]*"`
      versionOld=`grep "^version" $SOURCE_PATH/uninstallable/app_infos/$manifest | grep -o "[0-9]*\.[0-9]*\.[0-9]*"`
      vercomp "$versionOld" "$versionNew"
      result=$?
      if [ "$result" = "1" ]
      then
        cp_appinfo_package uninstallable $appid
    
        if [ -n "$status" ]
        then
          sed -i '/^status/s/\"[0-9]*\"/\"'$status'\"/g' $DEST_PATH/app_infos/$manifest
        fi

        if [ -d  $SOURCE_PATH/uninstallable/$appid ]
        then
          cp -rfp $SOURCE_PATH/uninstallable/$appid $DEST_PATH/
        fi
      fi
    fi

  done
}

