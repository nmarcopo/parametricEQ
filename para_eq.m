function para_eq(handles)
% Works in conjunction with DSPProject.m to produce a notch filter which
% creates a parametric equalizer
% Nicholas Marcopoli
% Microprocessors and Multimedia
% 4/28/17

% read in audio selection
switch handles.audioPop.Value
    case 1
        song = 'Kanye.mp3';
    case 2
        song = 'Jackson.mp3';
    case 3
        song = 'Gorillaz.mp3';
    case 4
        song = 'Lorde.mp3';
    case 5
        song = 'BadNews.mp3';
    case 6
        song = 'Beethoven.mp3';
    case 7
        song = 'Brad.mp3';
end
[audio, fs] = audioread(song);

% shortens audio sample to value specified in GUI
duration = [1,str2double(handles.durationText.String) * fs];
clear audio fs
[audio, fs] = audioread(song,duration);

Ts = 1/fs;                                   % Sampling Period
T = str2double(handles.durationText.String); % Duration of Sample
N = T/Ts;                                    % Number of samples

t = 0: Ts : (N-1)*Ts; % Time vector - sampling times

% Add a tone to simulate mic feedback in the sample
if handles.checkbox.Value == 1
    micfeedback = 400;              % Hz
    tone = cos(2*pi*micfeedback*t); % tone at 400 hz
    tone = tone';                   % transpose tone to be added to audio
    audio = audio + tone;           % add tone to audio
end

fc=handles.freqSlider.Value;      % Center frequency of boost/cut
w=2*pi*fc;                        % Convert to rad/sec
% "Damping" factor (controls frequency width of cut/boost)
zta=handles.widthSlider.Value;
decib = handles.ampSlider.Value;  % Desired amplification/attenuation in db
% Converts desired amplification/attenuation using db = 20log(alpha)
alph=10^(decib/20);

% Allows operations later in code to be executed upon button press
dofvtool = handles.viewFvButton.Value;
doaudio = handles.audioButton.Value;
dofaudio = handles.audioFButton.Value;

% Create filter from 2nd order transfer function - from Vincent Marcopoli
num=[1 2*zta*alph*w w^2];         % Continuous transfer function numerator
den=[1 2*zta*w w^2];              % Denominator
[numd,dend]=bilinear(num,den,fs); % Convert to digital IIR filter

% pass audio through filter
faudio = filter(numd,dend,audio);

% plot original audio fft while overlaying filter
spec = abs(fft(audio)); % Take magnitude of the fft
f = 0: 1/T: (N/2 - 1)/T; % plot frequency for audio duration

[h,w] = freqz(numd,dend,fs); % gets filter frequency response
% (needed to plot filter on GUI axis)
h = abs(h);
% plots original signal overlayed with frequency response of the filter
% frequency response is normalized (when w is divided by pi) then is converted
% into the same axis as the FFT graph (up to Nyquist)
plot(handles.origAxes,f,spec(1:N/2),w/pi*fs/2,h);
set(handles.origAxes,'XScale','log');
set(handles.origAxes,'YScale','log');
title(handles.origAxes,'fft of Original Signal');
xlabel(handles.origAxes,'f (Hz)');
legend(handles.origAxes,'Original Signal','Filter to be Applied','Location','Southwest');

% plot filtered audio fft on a log scale
spec = abs(fft(faudio)); % Take magnitude of the fft
f = 0: 1/T: (N/2 - 1)/T; % Plot frequency for audio duration
plot(handles.filtAxes,f,spec(1:N/2));
set(handles.filtAxes,'XScale','log');
set(handles.filtAxes,'YScale','log');
title(handles.filtAxes,'fft of Filtered Signal');
xlabel(handles.filtAxes,'f (Hz)');

% plot fvtool when button pressed
if dofvtool == 1
    fvtool(numd,dend);
end

% play original audio when button pressed
if doaudio == 1
    sound(audio,fs);
end

% play filtered audio when button pressed
if dofaudio == 1
    sound(faudio,fs);
end