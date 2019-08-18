[![CC BY-NC-SA 4.0](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc/4.0/)

# Thai-Eng_Swap for aegisub
Aegisub automation เปลี่ยนภาษาไทย<=>อังกฤษ

## Requirements
* Aegisub with support of Automation 4 (maybe working on 3?)

## Installation
1. Downloading the file.
2. Moving the file to "automation/autoload" in aegisub installation location.

## Usage

First, having the text forgotten to switch language keyboard layout.

```
line | text
1.   | ถถถ
2.   | l;ylfu8iy[
3.   | {\an8\fs50}gpj {\fs80} ัฟั
4.   | fu,kd
```

And select the line(s) you want to change and use ENG_to_TH or TH_to_ENG in the "fu,kdดีมาก" automation.

#### Changing from English to Thai by using ENG_to_TH

```
After using ENG_to_TH

line | text
1.   | ถถถ
2.   | สวัสดีครับ
3.   | {\an8\fs50}เย่ {\fs80} ัฟั
4.   | ดีมาก
```

#### Changing from English to Thai by using TH_to_ENG

```
After using TH_to_ENG

line | text
1.   | 555
2.   | l;ylfu8iy[
3.   | {\an8\fs50}gpj {\fs80} yay
4.   | fu,kd
```

##### Text within curly brackets will not be affected by any used of function.
```
text
{LOL ขำ}

text after used of function
{LOL ขำ}
```
## Note

* Thai keyboard layout is Thai-Kedmanee-based.
* English keyboard layout is QWERTY-based.
* Changing between two language at the same time is not posible due to the same character in both keyboard layout.

## License

Creative Commons Attribution-NonCommercial 4.0 International License. (CC BY-NC 4.0)
