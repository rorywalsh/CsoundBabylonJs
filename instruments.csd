<CsoundSynthesizer>
<CsInstruments>
nchnls = 2
0dbfs = 1

instr 1
   aEnv expon 1, p3, 0.001
   a1 oscili aEnv, p4
   outs a1, a1
   
endin

instr 2
a1 diskin2 "1.ogg", 1, 0, 0
   kFreq randh 1000, 10
   if metro(4) == 1 then
      event "i", 1, 0, .5, kFreq
   endif 
endin

</CsInstruments>
<CsScore>
f1 0 16 10 1
i2 0 z
</CsScore>
</CsoundSynthesizer>
     
        