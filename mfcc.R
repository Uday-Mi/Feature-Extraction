

library(wrassp)

library(readr)

library(tuneR)

library(signal)

library(oce)






normal = 'scale.wav'

normal = readWave(normal)

# Structure of File

str(normal)



# MFCC FUNCTION

func.mfcc = function(x) {
  sr1 = x@samp.rate
  
  mel.fc = melfcc(x, sr = sr1,
                  wintime = 0.015,        
                  hoptime = 0.005,       
                  # numcep = 2,            
                  sumpower = TRUE,       
                  nbands = 40,            
                  # bwidth = 1,            
                  preemph = 0.95,         
                  # frames_in_rows = TRUE
  )
  
}

mfcc.normal = func.mfcc(normal)



## Plot Spectrogram of Mel Frequency


# Spectrogram parameters

nfft = 512

window = 1500

overlap = 500

spectrogram = function(a,b,c) {
  
  # Duration in sec
  dur = length(a / (b@samp.rate))
  
  # Fequency in Hz
  fs = b@samp.rate
  
  
  ## Plot Spectrogram
  spec = specgram(x = a,
                  n = nfft,
                  Fs = fs,
                  window = window,
                  overlap = overlap)
  
  P = abs(spec$S)
  
  # Normalize
  
  P = P/max(P)
  
  # Convert to dB
  P = 10*log10(P)
  
  # Config time axis
  t = spec$t
  
  
  # Plotting
  imagep(x = t,
         y = spec$f,
         z = t(P),
         main = c,
         col = oce.colorsViridis,
         ylab = 'Frequency [Hz]',
         xlab = 'Time [s]',
         drawPalette = T,
         decimate = F)
  
}


spec.normal = spectrogram(mfcc.normal, normal, 'Normal- mel Spectrogram')



