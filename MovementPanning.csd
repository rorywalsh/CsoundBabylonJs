<CsoundSynthesizer>
<CsInstruments>
ksmps = 64
0dbfs = 1

instr 1
    aDeclick linseg 0, .1, 1, 10, 1
    ; creates a unique channel with same 
    ; name as game object
    SChannel strcpy p5
    SDistance sprintf "%sdistance", SChannel
    SPosition sprintf "%sposition", SChannel

    kDistance chnget SDistance
    kPan chnget SPosition
    
    if kPan < 1 then
        kLeft = 1-kPan/1000
        kRight = kPan/1000
    else
        kRight = 1-kPan/1000
        kLeft = kPan/1000
    endif

    printk2 kLeft
    printk2 kRight
    //printk2 1-(1/kPan)
    kDistance tonek kDistance, 10
    
    ; create or modify sounds
    ; remembering to adjust for distance
    a1 oscili 1, p6
    aScale = ampdb(-kDistance)
    aOut = a1*aScale


   
    outs aOut*aDeclick*kLeft, aOut*aDeclick*kRight
endin
</CsInstruments>
<CsScore>
f0 z
</CsScore>
</CsoundSynthesizer>

