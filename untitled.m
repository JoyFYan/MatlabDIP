function y = untitled(x)
%UNTITLED Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.2 and the DSP System Toolbox 8.5.
% Generated on: 24-Nov-2014 19:46:46

%#codegen

% To generate C/C++ code from this function use the codegen command. Type
% 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    % % FIR Window Lowpass filter designed using the FIR1 function.
    %
    % % All frequency values are in Hz.
    % Fs = 5000;  % Sampling Frequency
    %
    % N    = 173;      % Order
    % Fc   = 500;      % Cutoff Frequency
    % flag = 'scale';  % Sampling Flag
    %
    % % Create the window vector for the design algorithm.
    % win = hamming(N+1);
    %
    % % Calculate the coefficients using the FIR1 function.
    % b  = fir1(N, Fc/(Fs/2), 'low', win, flag);
    
    Hd = dsp.FIRFilter( ...
        'Numerator', [-0.000238096312218334 -9.23572665455801e-05 ...
        9.45088344384319e-05 0.000255060757943433 0.000327262874284794 ...
        0.000276596012049817 0.000111011999501364 -0.000117241298883904 ...
        -0.000325591466838162 -0.000428487179043948 -0.00037019960059375 ...
        -0.000151374406059235 0.00016235055827417 0.000456483551332078 ...
        0.000606555752408317 0.000527809901531746 0.000216900553772996 ...
        -0.00023335332259954 -0.000657117653820067 -0.000873299122626727 ...
        -0.000759206972962866 -0.000311413738441238 0.000334169200404308 ...
        0.000938032685921958 0.00124212107525603 0.00107557032853907 ...
        0.000439325281604174 -0.000469364924545161 -0.00131163269770247 ...
        -0.00172896428999301 -0.00149034219953394 -0.000605998907384178 ...
        0.000644557083392964 0.00179335261678094 0.00235390424719192 ...
        0.00202065480872615 0.000818354612937056 -0.000867081598138711 ...
        -0.00240360332875262 -0.0031438203489767 -0.00268973420299863 ...
        -0.00108589142634225 0.00114713465266705 0.00317110912032932 ...
        0.00413701314365031 0.00353108877330903 0.00142248485891351 ...
        -0.0014997963347362 -0.0041388855196291 -0.00539156109786991 ...
        -0.00459617445460325 -0.00184971512677814 0.00194882445962818 ...
        0.00537559425448224 0.0070014159406214 0.00596937586231255 ...
        0.00240347333864478 -0.00253430899454458 -0.00699885214026783 ...
        -0.00913005140806812 -0.00779993711090016 -0.00314833337837061 ...
        0.00332969033181551 0.00922826522806906 0.0120889290106191 ...
        0.0103783997164996 0.00421293401190891 -0.00448493374135988 ...
        -0.0125243853281956 -0.0165503633206705 -0.0143519128462654 ...
        -0.00589379612753151 0.00635897714314243 0.0180362995524368 ...
        0.0242710384873849 0.0215010131629075 0.00905566858862012 ...
        -0.0100703283894739 -0.0296286219229201 -0.0417091158098821 ...
        -0.0391010821437118 -0.0177153636265569 0.0217180395585552 ...
        0.0732817569431719 0.12704495636511 0.171510631126317 0.196652994719929 ...
        0.196652994719929 0.171510631126317 0.12704495636511 0.0732817569431719 ...
        0.0217180395585552 -0.0177153636265569 -0.0391010821437118 ...
        -0.0417091158098821 -0.0296286219229201 -0.0100703283894739 ...
        0.00905566858862012 0.0215010131629075 0.0242710384873849 ...
        0.0180362995524368 0.00635897714314243 -0.00589379612753151 ...
        -0.0143519128462654 -0.0165503633206705 -0.0125243853281956 ...
        -0.00448493374135988 0.00421293401190891 0.0103783997164996 ...
        0.0120889290106191 0.00922826522806906 0.00332969033181551 ...
        -0.00314833337837061 -0.00779993711090016 -0.00913005140806812 ...
        -0.00699885214026783 -0.00253430899454458 0.00240347333864478 ...
        0.00596937586231255 0.0070014159406214 0.00537559425448224 ...
        0.00194882445962818 -0.00184971512677814 -0.00459617445460325 ...
        -0.00539156109786991 -0.0041388855196291 -0.0014997963347362 ...
        0.00142248485891351 0.00353108877330903 0.00413701314365031 ...
        0.00317110912032932 0.00114713465266705 -0.00108589142634225 ...
        -0.00268973420299863 -0.0031438203489767 -0.00240360332875262 ...
        -0.000867081598138711 0.000818354612937056 0.00202065480872615 ...
        0.00235390424719192 0.00179335261678094 0.000644557083392964 ...
        -0.000605998907384178 -0.00149034219953394 -0.00172896428999301 ...
        -0.00131163269770247 -0.000469364924545161 0.000439325281604174 ...
        0.00107557032853907 0.00124212107525603 0.000938032685921958 ...
        0.000334169200404308 -0.000311413738441238 -0.000759206972962866 ...
        -0.000873299122626727 -0.000657117653820067 -0.00023335332259954 ...
        0.000216900553772996 0.000527809901531746 0.000606555752408317 ...
        0.000456483551332078 0.00016235055827417 -0.000151374406059235 ...
        -0.00037019960059375 -0.000428487179043948 -0.000325591466838162 ...
        -0.000117241298883904 0.000111011999501364 0.000276596012049817 ...
        0.000327262874284794 0.000255060757943433 9.45088344384319e-05 ...
        -9.23572665455801e-05 -0.000238096312218334]);
end

y = step(Hd,x);
mcc -t -l untitled.m

% [EOF]