* TMS320 Peripherial UART Control

Aplikacja do sterowania mikrokontrolerem przez UART powsta�a w �rodowisku MATLAB. Jest to prosty interfejs graficzny prezentuj�cy odczyty z mikrokontrolera oraz pozwalaj�cy na wprowadzenie danych i wys�anie ich do mikrokontrolera. Po uruchomieniu program wyszukuje dost�pne porty szeregowe w komputerze i prosi u�ytkownika o wprowadzenie portu, do kt�rego pod��czony jest mikrokontroler. Po zestawieniu po��czenia program oczekuje na ramk� danych z mikrokontrolera i na bie��co aktualizuje elementy GUI.

Program pracuje asynchronicznie. Ramka odbioru danych zrealizowana zosta�a na dedykowanym callback'u wywo�ywanym, gdy komputer odbierze pe�n� ramk� danych (zako�czon� znakami CR i LF). R�wnie� wci�ni�cie przycisk�w wywo�uje dedykowane callback'i, kt�re (zale�nie od wybranego przycisku) zbieraj� dane z odpowiednich p�l tekstowych, konwertuj� je, waliduj� i wysy�aj� przez UART do mikrokontrolera.

** Obs�uga

- Uruchomi� plik *TMS_pc_contro.m* w Matlabie
- Wpisa� port szeregowy i klikn�� OK
