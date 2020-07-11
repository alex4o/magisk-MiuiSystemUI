# Remove Miui Navigation Bar
This is a [Magisk](https://topjohnwu.github.io/Magisk/) module that removes the Navigation Bar from Miui 12 by [Xiaomi.eu](https://xiaomi.eu/), this rom is deodexed so patching shouldn't be a problem. 

## Actual  changes made
In case you don't want to install random SystemUI.apk on the internet this will be an outline of the changes I made, and how I made them.
First /system/priv-app/MiuiSystemUI/MiuiSystemUI.apk was pulled from my phone to my pc. Then the baksmali program was used to dissasemble the apk and produce a folder with all the classes that were compiled inside of the apk. The two files that are of interest to us are StatusBar.smali and StastusBar$14.smali. The only thing that was done to them was changing 2 line off code which can just be deleted as well. After these edits the smali program was used to produce the nedded `classes.dex` file which could then be replaced inside of the original apk. Then you can recreate this module yourself and install it. There is a usefull Makefile provided in this repo.

These are the exact changes for the referance:
com/android/systemui/statusbar/phone/StatusBar$14.smali line 95 turns into this:
```smali

# invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/phone/StatusBar;->createNavigationBar(Landroid/view/Display;)V

```

com/android/systemui/statusbar/phone/StatusBar.smali line 18741 turns into this:
```smali

# invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/StatusBar;->createNavigationBar()V

```


