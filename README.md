# Thai-Eng_Swap
Aegisub automation เปลี่ยนภาษาไทย<=>อังกฤษ

## Usage

First, having the text forgotten to switch language keyboard layout.

```
line | text
1.   | ถถถ
2.   | l;ylfu8iy[
3.   | {\an8\fs50}gpj {\fs80} ัฟั
```

And select the line(s) you want to change.

#### Changing from English to Thai by using ENG_to_TH.

```
After using ENG_to_TH

line | text
1.   | ถถถ
2.   | สวัสดีครับ
3.   | {\an8\fs50}เย่ {\fs80} ัฟั
```

#### Changing from English to Thai by using TH_to_ENG.

```
After using TH_to_ENG

line | text
1.   | 555
2.   | l;ylfu8iy[
3.   | {\an8\fs50}gpj {\fs80} yay
```

##### Text within curly brackets will not affected by any used of function
```
text
{LOL ขำ}

text after used of function
{LOL ขำ}
```
## Note

Thai keyboard layout is Thai-Kedmanee-based</br>
English keyboard layout is QWERTY-based
