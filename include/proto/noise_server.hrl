%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.14.1

-ifndef(noise_server).
-define(noise_server, true).

-define(noise_server_gpb_version, "4.14.1").

-ifndef('PB_NOISE_MESSAGE_PB_H').
-define('PB_NOISE_MESSAGE_PB_H', true).
-record(pb_noise_message,
        {message_type = 'XX_A',         % = 1, {enum,'pb_noise_message.MessageType'} (optional)
         content = <<>>                 % = 2, bytes (optional)
        }).
-endif.

-endif.
