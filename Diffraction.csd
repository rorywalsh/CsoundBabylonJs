<CsoundSynthesizer>
<CsInstruments>
0dbfs = 1
nchnls = 2

instr PLAY_SOUND
    prints "Starting playback"
    SFilename strcpy p4
    iLength = filelen(SFilename)
    iChannels = filenchnls(SFilename)

    SChannel strcpy p5
    kCutOff = tonek(chnget:i(SChannel), 10)
    print chnget:i(SChannel)
    ;printk2 kCutOff

    p3 = iLength
    if iChannels == 2 then
            a1, a2 diskin2 SFilename, 1, 0, 1
            outs tone(a1, kCutOff), tone(a2, kCutOff)
    else
            a1 diskin2 SFilename, 1, 0, 1
            outs tone(a1, kCutOff), tone(a1, kCutOff)
    endif
endin

</CsInstruments>
<CsScore>
f0 z
</CsScore>
</CsoundSynthesizer>

