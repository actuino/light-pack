Here is all information about Lightpack do-it-yourself. It is supposed that there is no need to explain what Heat Toner Transfer Method is, [how to use a soldering iron](http://mightyohm.com/files/soldercomic/FullSolderComic_EN.pdf) and how to solder ICs in TQFP package. Besides that, we hope you have already viewed the [device operational principals](http://code.google.com/p/light-pack/wiki/Basics).

Let’s go at once to the scheme and the table of the components used (you can click on all images):
<div><a href='https://picasaweb.google.com/lh/photo/tcp2lSpN84zuY0T_PuVEv9MTjNZETYmyPJy0liipFm0?feat=directlink'><img src='https://lh3.googleusercontent.com/-GFRW15vGMUw/T5aVKUs7AoI/AAAAAAAACww/qLcmBqVQ8DM/s700/Lightpack60L_schematics.png' width='700' /></a></div>

| **Name** | **Nominal** | **Package** |
|:---------|:------------|:------------|
| `IC1` |[MCU Atmel AT90USB162](http://www.atmel.com/dyn/resources/prod_documents/doc7707.pdf)|TQFP32|
| `IC2, IC3` | LED driver [SiTI DM631](http://www.siti.com.tw/product/spec/LED/DM631.pdf) or [DM633](http://www.siti.com.tw/product/spec/LED/DM633.pdf) |SOP24-1.27|
| `IC4` | Suppressor [USB6B1](http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00001361.pdf) | SO8 |
| `LED1-10` | Chip-LED like ReFond RF-W2SA50TS-A39|PLCC-6|
| `C1, C2` |Capacitor 18 pF (ceramic)|1206|
| `С3, C5` |4,7 uF, 16V (ceramic/tantalic)|1206|
| `С4` |47 uF (tantalic)|C or D|
| `C6` | 10 nF, 50V (ceramic) |1206|
| `C7, C8, C9` | 100 nF (ceramic) |1206|
| `R1` |Resistor 20 kOhm |1206|
| `R2` |100 kOhm |1206|
| `R3, R4` |22 Ohm|1206|
| `R5, R6` |3,9 kOhm (3 kOhm in case DM633) |1206|
| `R7, R9` |1 kOhm |1206|
| `R8` |1 MOhm |1206|
| `D1` |BAV70 (double diod) |SOT23|
| `D2` |Diod SS14 |SMB|
| `Q1` |Crystal oscillator 16 MHz|SMD|
| `SW1` |SMD push button|SMD|
| `LED_TX` | Simple SMD monocolor LED for activity indication|0805|
| `USB` |USB socket mini B (USB/M-1J)|--|
| `PWR_JCK` |AC socket (DJK-02B)|--|

You will need, of course, a ribbon cable, or any other cable you like, to connect a master board with LEDs.

In `revision 6.0L` a suppressor (IC4) has been added. You may not use this element, if any problems with its purchasing appear. The suppressor is used to protect USB databus. It is the set of diodes and is installed behind USB socket so that 4 active contacts go firstly through it. If you think that in the scheme the suppressor is connected at random, right you are – this is the peculiarity of the components of Eagle CAD library, that we didn’t have time to fix. For the same reason there are two not finished connections (according to Eagle) in the layout on the Unrouted layer.

In the `revision 6` the drivers with built-in PWM are used instead of those we used earlier (MBI 5026). These elements are of SiTI company production, LED driver DM631 and more advanced one DM633. It is not so easy to find these components in retail in our country, so if you know (or you’ve intentionally found them) similar ones in every way, send the information about them to us.

You should pay your attention to the current-limiting resistors `R5` and `R6`. If your LEDs are different from those ones we used, you should choose the nominal of the resistors `R5` and `R6` according to your LEDs datasheet. If the nominal is too low, your LEDs may burn or the drivers will get too hot. If the nominal is too high, then the maximum brightness decreases. **Besides that, if you use DM633 an hier grade analogue of the drivers we recommended, you should use the resistors `R5` and `R6` with the value 3kOhm**.

A few words about LEDs. Starting with the version 5.5 we use the simplest ReFond LEDs with the common anode. **CLV1A-FKB** of [CREE](http://www.cree.com/) were used in the old Lightpack versions. They are very small (3,2х2,8 mm) chip LEDs, but we were just impressed by their brightness and spot uniformity. But unfortunately, they are much more expensive and it is more difficult to find them. However, just in case we have in the PCB layout a variant of a pad for them either.

When implementing the first pilot models we tried half-dozen of different through-hole LEDs (for straight-though joint) -– all of them were not good enough. The main problems are distinct traces of each RGB color even when their mixing and bad work on small distances (less than 20 cm) from a wall.

LED-strips can be easily connected to Lightpack of the 6th revision that highly increase the number of LEDs (not capture areas). It can be useful if you need to install the device to the TV set with main diagonal. You can read about the strips and power supply characteristics for this in the [special post](http://pixelkit.ru/post/10930981074/5-5) in our blog (russian).

You can download from [Downloads](http://code.google.com/p/light-pack/downloads/list) section the schematics and the PCB layout in the format of free [Eagle CAD](http://cadsoft.de/).
<div><a href='https://picasaweb.google.com/lh/photo/UDA16-O6El6-0XIG6WqC6dMTjNZETYmyPJy0liipFm0?feat=directlink'><img src='https://lh3.googleusercontent.com/-YhRyNDFVunw/T5aVT6AlpKI/AAAAAAAACww/VAcb6jWTaok/s700/Lightpack60L_layout.png' width='700' /></a></div>

The most of traces have 0,3 mm width – the PCB could be made by heat toner transfer method without any difficulties. The master card size is 90х40 mm. The sizes of the cards for external LEDs are 15х15 mm. Such card can be made to 10 pcs. So called zero ohm jumpers are used in the layout -– ordinary jumpers are necessary to cross over another trace. However, we couldn’t totally avoid the second layer. The most things can be improved, but the total length of the traces will increase very much. So we advise you not to etch the bottom layer, but just drill the textolite and use some cable or wire for laying these four traces.

There is one additional LED in the PCB file. It’s most likely that you will desire to print some more. To do it in Eagle:
  1. Close the window with the device schematic
  1. Choose successively the tool **Copy** and then **Group** on the left side of the tool box in the window with layout
  1. Select the whole image of the external LED and click on the right mouse button on it. At the bottom of the menu you see **Copy:Group** – press on it and replace a new PCB where you want
In the same way it is possible to move the object groups in Eagle.

When printing the layout do not forget that it is done on the layer Top for SMD-components. It means you should tick the box Mirror in the print settings from Eagle.

Please, when installing components pay your attention to the layout peculiarities. Be sure that traces under the buttons and the USB socket don’t make contact with one another. And when you solder LEDs cables be sure that RGB pad cables don’t make contact with the Vbus, that is on the master board perimeter. It is not necessary, but recommended to install the indicator LED\_TX and the current-limiting resistor to it.
<div><a href='https://picasaweb.google.com/lh/photo/doYnyRKyTiXJ5ypE4_19vNMTjNZETYmyPJy0liipFm0?feat=directlink'><img src='https://lh4.googleusercontent.com/-g7Uohz9O7Us/T5aVcs4LhOI/AAAAAAAACww/e-CSrzZL0Yk/s700/Lightpack60L_vert.jpg' width='700' /></a></div>

After the device is assembled, but not installed it is necessary to upload the firmware into it and check the efficiency. It can be done directly by USB without external programming units. The whole process is described in [Flip section](http://www.atmel.com/tools/FLIP.aspx) of Atmel site. Besides that, it’s useful to read about the capture program [settings description](http://code.google.com/p/light-pack/wiki/SettingsDescription). If the software refuses to connect to your device in Linux, it is most likely that you will have to [modify the permissions](http://tuxpool.blogspot.com/2009/12/changing-usb-device-permissions-in.html) of USB-device in the system settings or just put [this file](http://code.google.com/p/light-pack/source/browse/93-lightpack.rules) into `/etc/udev/rules.d/` .

Please, send us the photos of your devices you made and foremost the samples of installation – we will add them to the [special album](https://picasaweb.google.com/atarity/GdWVXG#). These are the samples of the old 4.3 revision from users.

|<div><a href='https://picasaweb.google.com/lh/photo/X9RkKhYUdU_B6G8auakAvg?feat=embedwebsite'><img src='https://lh5.googleusercontent.com/-D9BO5L9tlds/TlTVmrtG_rI/AAAAAAAAB4Q/Y8VrlpiloYo/s288/lightpack_Licrym.JPG' width='270' /></a></div>|<div><a href='https://picasaweb.google.com/lh/photo/mRrNgU8ZM7Qh-DP8yJQpGw?feat=embedwebsite'><img src='https://lh6.googleusercontent.com/_pcbSxfY74TA/TXYYsAnfUuI/AAAAAAAABKM/cSmG1fLIujs/s288/IMG_1831.jpg' width='270' /></a></div>|<div><a href='https://picasaweb.google.com/lh/photo/SHvoPvOBlIIZsB7431VJyQ?feat=embedwebsite'><img src='https://lh4.googleusercontent.com/_pcbSxfY74TA/TXfjDWIPggI/AAAAAAAABLE/aUJZeRDWbYk/s288/b7f45398235097ec00f16340788752dd.jpg' width='270' /></a></div>|
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|<div><a href='https://picasaweb.google.com/lh/photo/_qCU3xZZr_9-hO9LuMwH3g?feat=embedwebsite'><img src='https://lh6.googleusercontent.com/_pcbSxfY74TA/TXfjCqaIVsI/AAAAAAAABK4/60sRkAPc1pg/s288/aec4ffa.jpg' width='270' /></a></div>|<div><a href='https://picasaweb.google.com/lh/photo/I2VOhcV2mWaJA_BlfhQOFg?feat=embedwebsite'><img src='https://lh6.googleusercontent.com/_pcbSxfY74TA/TXfmJEyiZZI/AAAAAAAABLk/FabDYTPqeMU/s288/5407235758_85d8769624_b.jpg' width='270' /></a></div>|<div><a href='https://picasaweb.google.com/lh/photo/t_YJRmvt-iSPgh9dk3vtsQ?feat=embedwebsite'><img src='https://lh6.googleusercontent.com/_pcbSxfY74TA/TbnITxv17hI/AAAAAAAABe4/TZBlrv6D3tI/s288/IMG_2844.jpg' width='270' /></a></div>|
|<div><a href='https://picasaweb.google.com/lh/photo/H1bxY0RO7S-1VS887hryNg?feat=embedwebsite'><img src='https://lh5.googleusercontent.com/_pcbSxfY74TA/TZWKKcXSroI/AAAAAAAABW4/zcEK8CDMxZI/s288/20110330_1950%281%29.JPG' width='270' /></a></div>|<div><a href='https://picasaweb.google.com/lh/photo/pFiK73Wwn_aOkL_MhDMVdg?feat=embedwebsite'><img src='https://lh5.googleusercontent.com/_pcbSxfY74TA/TXfjC1Gy_3I/AAAAAAAABK8/xGNRaEoWzZY/s288/2fa6df0bc083af2806244f95ad2caa95.jpg' width='270' /></a></div>|<div><a href='https://picasaweb.google.com/lh/photo/2ov2yXl-rceD5QOWvQyZxQ?feat=embedwebsite'><img src='https://lh5.googleusercontent.com/_pcbSxfY74TA/TcenK7m2-hI/AAAAAAAABhQ/bvGr5vc6C8k/s288/%D0%91%D0%B5%D0%B7-%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8-37.jpg' width='270' /></a></div>|