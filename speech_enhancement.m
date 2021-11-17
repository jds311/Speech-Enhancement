close all;
clear all;
[y fs]= audioread('NSph.wav');
signal_len = length(y);
frame_len=0.01*fs;
frame_step=0.005*fs;
num_frames =1+ ceil((signal_len - frame_len)/frame_step);
padded_len = (num_frames-1)*frame_step + frame_len;
% making sure signal is exactly divisible into N frames
padded_y = [y', zeros(1, padded_len - signal_len)];
%calculating frame indices
indices = repmat(1:frame_len, num_frames, 1) + repmat((0: frame_step: num_frames*frame_step-1)', 1, frame_len);
frames = padded_y(indices);
noise_frames = floor(0.5*fs/frame_step);
window_fn = repmat(hamming(frame_len)', size(frames, 1), 1);
windowed_frames = frames.* window_fn;
%%%% Calculating Power spectrum of each frame%%%%%%%%%
Y_spec = fft(frames,frame_len,2);% complex spectrum
figure(2);
subplot(3,1,1);
plot(abs(Y_spec(noise_frames,:)));
title('Magnitude Spectrum of Noisy signal of a single frame');
xlabel('Samples');ylabel('Amplitude');
Ymag_spec = abs(Y_spec).^2; % power spectrum of noisy signal
figure(1);
subplot(2,1,1);
plot(Ymag_spec(noise_frames,:));
title('Power Spectrum of Noisy signal of a single frame');
xlabel('Samples');ylabel('Amplitude');
phase = angle(Y_spec); % phase of noisy signal

