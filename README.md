# Speech-Enhancement
This project is inspired from the things I learnt while studing the Signals and systems course. It is often seen that there is a lot of disturbance while talking on phone if someone is at a busy place or in a remote area. We have tried to create a light weight script that filters this noise and gives a clear speech as output. For demo, we took a clear speech audio and added random noise to it. Then we passed it through our filter and compared the output with the original speech. For filtering we have used two different methodologies, and then compared their performance.

### Weiner Filter
- Wiener filter is traditionally used for filtering Images, but we experimented and observed the results it gave for sound wave.

<div align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Wiener_block.svg/700px-Wiener_block.svg.png"/>
</div>

### Spectral Subtraction
- This method does the filtering in frequency domain. Firstly, we transform the signal using fast fourier transform and then process the signal. The noise spectrum is estimated during speech pauses, and is subtracted from the noisy speech spectrum to estimate the clean speech. Finally we apply inverse fourier transform to get the clean sound
<div align="center">
<img src="https://www.researchgate.net/profile/Dhiraj-Nitnaware/publication/330136743/figure/fig1/AS:711339660042240@1546607999272/Spectral-Subtraction-Method-Block-Diagram-2.ppm"/ height = 400 width = 550>
</div>
