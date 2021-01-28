* TMS320 Peripherial UART Control

Aplikacja do sterowania mikrokontrolerem przez UART powsta³a w œrodowisku MATLAB. Jest to prosty interfejs graficzny prezentuj¹cy odczyty z mikrokontrolera oraz pozwalaj¹cy na wprowadzenie danych i wys³anie ich do mikrokontrolera. Po uruchomieniu program wyszukuje dostêpne porty szeregowe w komputerze i prosi u¿ytkownika o wprowadzenie portu, do którego pod³¹czony jest mikrokontroler. Po zestawieniu po³¹czenia program oczekuje na ramkê danych z mikrokontrolera i na bie¿¹co aktualizuje elementy GUI.

Program pracuje asynchronicznie. Ramka odbioru danych zrealizowana zosta³a na dedykowanym callback'u wywo³ywanym, gdy komputer odbierze pe³n¹ ramkê danych (zakoñczon¹ znakami CR i LF). Równie¿ wciœniêcie przycisków wywo³uje dedykowane callback'i, które (zale¿nie od wybranego przycisku) zbieraj¹ dane z odpowiednich pól tekstowych, konwertuj¹ je, waliduj¹ i wysy³aj¹ przez UART do mikrokontrolera.

** Obs³uga

- Uruchomiæ plik *TMS_pc_contro.m* w Matlabie
- Wpisaæ port szeregowy i klikn¹æ OK
