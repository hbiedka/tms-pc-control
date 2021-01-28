# TMS320 Peripherial UART Control

Aplikacja do sterowania mikrokontrolerem przez UART powstała w środowisku MATLAB. Jest to prosty interfejs graficzny prezentujący odczyty z mikrokontrolera oraz pozwalający na wprowadzenie danych i wysłanie ich do mikrokontrolera. Po uruchomieniu program wyszukuje dostępne porty szeregowe w komputerze i prosi użytkownika o wprowadzenie portu, do którego podłączony jest mikrokontroler. Po zestawieniu połączenia program oczekuje na ramkę danych z mikrokontrolera i na bieżąco aktualizuje elementy GUI.

Program pracuje asynchronicznie. Ramka odbioru danych zrealizowana została na dedykowanym callback'u wywoływanym, gdy komputer odbierze pełną ramkę danych (zakończoną znakami CR i LF). Również wciśnięcie przycisków wywołuje dedykowane callback'i, które (zależnie od wybranego przycisku) zbierają dane z odpowiednich pól tekstowych, konwertują je, walidują i wysyłają przez UART do mikrokontrolera.

### Obsługa

- Uruchomić plik *TMS_pc_contro.m* w Matlabie
- Wpisać port szeregowy i kliknąć OK
