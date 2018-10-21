fs = 44100; % sampling frequency (Hz)
t = 0 : 1/fs : 0.5; % time axis (seconds)
A1 = .2;
w = 0; % phase
A4 = A1 * sin( 2 * pi * 440.00 * t + w ); % note A4
Bb4 = A1 * sin( 2 * pi * 466.16 * t + w ); % note Bb4
C4 = A1 * sin( 2 * pi * 261.63 * t + w ); % note C4
D4 = A1 * sin( 2 * pi * 293.66 * t + w ); % note D4 
E4 = A1 * sin( 2 * pi * 329.63 * t + w ); % note E4 
F4 = A1 * sin( 2 * pi * 349.23 * t + w ); % note F4 
G4 = A1 * sin( 2 * pi * 392.00 * t + w ); % note G4
y=[C4 F4 F4 G4 F4 E4 D4 D4 D4 G4 G4 A4 G4 F4 E4 C4 C4 A4 A4 Bb4]; % Tone bai hat Merry Christmas.
[g,fs] = audioread('orig_input.wav');
m = g + (y(1:length(g)))'; %Tron giai dieu voi file ghi am ban dau.
soundsc(m,44100);
filename = 'melody.wav';
audiowrite(filename,m,fs);

[m,fs] = audioread('melody.wav');
xlabel('Frequency(Hz)');
figure(1)
N = fs % number of FFT points
transform = fft(m,N)/N;
magTransform = abs(transform);
faxis = linspace(-N/2,N/2,N);
plot(faxis,fftshift(magTransform));
title('The Spectrum');
xlabel('Frequency(Hz)');

win = 128 % window length in samples
% number of samples between overlapping windows:
hop = win/2            
nfft = win %width of each frequency bin 
figure(2)
spectrogram(m,win,hop,nfft,fs,'yaxis');
% change the tick labels of the graph from scientific notation to floating point: 
yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt));
title('Spectrogram');