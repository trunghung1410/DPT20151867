r = audiorecorder(44100,16,1);      % Ghi am voi fs = 44100,16-bit,1-channel 
disp('Start speaking.')             % Chuan bi ghi am
recordblocking(r, 10);               % Cho phep ghi am vao bien r voi thoi gian 10s 
disp('End of Recording.');          % Ket thuc ghi am
play(r);                            % Phat lai doan ghi am
myRecording = getaudiodata(r,'int16');  % Doc du lieu doan ghi am
filename = 'orig_input.wav'             % File ghi am
audiowrite(filename, myRecording, 44100)% Luu file ghi am

