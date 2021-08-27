%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.14.1
-module(noise_server).

-export([encode_msg/1, encode_msg/2, encode_msg/3]).
-export([decode_msg/2, decode_msg/3]).
-export([merge_msgs/2, merge_msgs/3, merge_msgs/4]).
-export([verify_msg/1, verify_msg/2, verify_msg/3]).
-export([get_msg_defs/0]).
-export([get_msg_names/0]).
-export([get_group_names/0]).
-export([get_msg_or_group_names/0]).
-export([get_enum_names/0]).
-export([find_msg_def/1, fetch_msg_def/1]).
-export([find_enum_def/1, fetch_enum_def/1]).
-export([enum_symbol_by_value/2, enum_value_by_symbol/2]).
-export(['enum_symbol_by_value_pb_noise_message.MessageType'/1, 'enum_value_by_symbol_pb_noise_message.MessageType'/1]).
-export([get_service_names/0]).
-export([get_service_def/1]).
-export([get_rpc_names/1]).
-export([find_rpc_def/2, fetch_rpc_def/2]).
-export([fqbin_to_service_name/1]).
-export([service_name_to_fqbin/1]).
-export([fqbins_to_service_and_rpc_name/2]).
-export([service_and_rpc_name_to_fqbins/2]).
-export([fqbin_to_msg_name/1]).
-export([msg_name_to_fqbin/1]).
-export([fqbin_to_enum_name/1]).
-export([enum_name_to_fqbin/1]).
-export([get_package_name/0]).
-export([uses_packages/0]).
-export([source_basename/0]).
-export([get_all_source_basenames/0]).
-export([get_all_proto_names/0]).
-export([get_msg_containment/1]).
-export([get_pkg_containment/1]).
-export([get_service_containment/1]).
-export([get_rpc_containment/1]).
-export([get_enum_containment/1]).
-export([get_proto_by_msg_name_as_fqbin/1]).
-export([get_proto_by_service_name_as_fqbin/1]).
-export([get_proto_by_enum_name_as_fqbin/1]).
-export([get_protos_by_pkg_name_as_fqbin/1]).
-export([gpb_version_as_string/0, gpb_version_as_list/0]).

-include("noise_server.hrl").
-include("gpb.hrl").


-spec encode_msg(#pb_noise_message{}) -> binary().
encode_msg(Msg) when tuple_size(Msg) >= 1 -> encode_msg(Msg, element(1, Msg), []).

-spec encode_msg(#pb_noise_message{}, atom() | list()) -> binary().
encode_msg(Msg, MsgName) when is_atom(MsgName) -> encode_msg(Msg, MsgName, []);
encode_msg(Msg, Opts) when tuple_size(Msg) >= 1, is_list(Opts) -> encode_msg(Msg, element(1, Msg), Opts).

-spec encode_msg(#pb_noise_message{}, atom(), list()) -> binary().
encode_msg(Msg, MsgName, Opts) ->
    case proplists:get_bool(verify, Opts) of
        true -> verify_msg(Msg, MsgName, Opts);
        false -> ok
    end,
    TrUserData = proplists:get_value(user_data, Opts),
    case MsgName of pb_noise_message -> encode_msg_pb_noise_message(id(Msg, TrUserData), TrUserData) end.


encode_msg_pb_noise_message(Msg, TrUserData) -> encode_msg_pb_noise_message(Msg, <<>>, TrUserData).


encode_msg_pb_noise_message(#pb_noise_message{message_type = F1, content = F2}, Bin, TrUserData) ->
    B1 = if F1 == undefined -> Bin;
            true ->
                begin
                    TrF1 = id(F1, TrUserData),
                    if TrF1 =:= 'XX_A'; TrF1 =:= 0 -> Bin;
                       true -> 'e_enum_pb_noise_message.MessageType'(TrF1, <<Bin/binary, 8>>, TrUserData)
                    end
                end
         end,
    if F2 == undefined -> B1;
       true ->
           begin
               TrF2 = id(F2, TrUserData),
               case iolist_size(TrF2) of
                   0 -> B1;
                   _ -> e_type_bytes(TrF2, <<B1/binary, 18>>, TrUserData)
               end
           end
    end.

'e_enum_pb_noise_message.MessageType'('XX_A', Bin, _TrUserData) -> <<Bin/binary, 0>>;
'e_enum_pb_noise_message.MessageType'('XX_B', Bin, _TrUserData) -> <<Bin/binary, 1>>;
'e_enum_pb_noise_message.MessageType'('XX_C', Bin, _TrUserData) -> <<Bin/binary, 2>>;
'e_enum_pb_noise_message.MessageType'('IK_A', Bin, _TrUserData) -> <<Bin/binary, 3>>;
'e_enum_pb_noise_message.MessageType'('IK_B', Bin, _TrUserData) -> <<Bin/binary, 4>>;
'e_enum_pb_noise_message.MessageType'('XX_FALLBACK_A', Bin, _TrUserData) -> <<Bin/binary, 5>>;
'e_enum_pb_noise_message.MessageType'('XX_FALLBACK_B', Bin, _TrUserData) -> <<Bin/binary, 6>>;
'e_enum_pb_noise_message.MessageType'(V, Bin, _TrUserData) -> e_varint(V, Bin).

-compile({nowarn_unused_function,e_type_sint/3}).
e_type_sint(Value, Bin, _TrUserData) when Value >= 0 -> e_varint(Value * 2, Bin);
e_type_sint(Value, Bin, _TrUserData) -> e_varint(Value * -2 - 1, Bin).

-compile({nowarn_unused_function,e_type_int32/3}).
e_type_int32(Value, Bin, _TrUserData) when 0 =< Value, Value =< 127 -> <<Bin/binary, Value>>;
e_type_int32(Value, Bin, _TrUserData) ->
    <<N:64/unsigned-native>> = <<Value:64/signed-native>>,
    e_varint(N, Bin).

-compile({nowarn_unused_function,e_type_int64/3}).
e_type_int64(Value, Bin, _TrUserData) when 0 =< Value, Value =< 127 -> <<Bin/binary, Value>>;
e_type_int64(Value, Bin, _TrUserData) ->
    <<N:64/unsigned-native>> = <<Value:64/signed-native>>,
    e_varint(N, Bin).

-compile({nowarn_unused_function,e_type_bool/3}).
e_type_bool(true, Bin, _TrUserData) -> <<Bin/binary, 1>>;
e_type_bool(false, Bin, _TrUserData) -> <<Bin/binary, 0>>;
e_type_bool(1, Bin, _TrUserData) -> <<Bin/binary, 1>>;
e_type_bool(0, Bin, _TrUserData) -> <<Bin/binary, 0>>.

-compile({nowarn_unused_function,e_type_string/3}).
e_type_string(S, Bin, _TrUserData) ->
    Utf8 = unicode:characters_to_binary(S),
    Bin2 = e_varint(byte_size(Utf8), Bin),
    <<Bin2/binary, Utf8/binary>>.

-compile({nowarn_unused_function,e_type_bytes/3}).
e_type_bytes(Bytes, Bin, _TrUserData) when is_binary(Bytes) ->
    Bin2 = e_varint(byte_size(Bytes), Bin),
    <<Bin2/binary, Bytes/binary>>;
e_type_bytes(Bytes, Bin, _TrUserData) when is_list(Bytes) ->
    BytesBin = iolist_to_binary(Bytes),
    Bin2 = e_varint(byte_size(BytesBin), Bin),
    <<Bin2/binary, BytesBin/binary>>.

-compile({nowarn_unused_function,e_type_fixed32/3}).
e_type_fixed32(Value, Bin, _TrUserData) -> <<Bin/binary, Value:32/little>>.

-compile({nowarn_unused_function,e_type_sfixed32/3}).
e_type_sfixed32(Value, Bin, _TrUserData) -> <<Bin/binary, Value:32/little-signed>>.

-compile({nowarn_unused_function,e_type_fixed64/3}).
e_type_fixed64(Value, Bin, _TrUserData) -> <<Bin/binary, Value:64/little>>.

-compile({nowarn_unused_function,e_type_sfixed64/3}).
e_type_sfixed64(Value, Bin, _TrUserData) -> <<Bin/binary, Value:64/little-signed>>.

-compile({nowarn_unused_function,e_type_float/3}).
e_type_float(V, Bin, _) when is_number(V) -> <<Bin/binary, V:32/little-float>>;
e_type_float(infinity, Bin, _) -> <<Bin/binary, 0:16, 128, 127>>;
e_type_float('-infinity', Bin, _) -> <<Bin/binary, 0:16, 128, 255>>;
e_type_float(nan, Bin, _) -> <<Bin/binary, 0:16, 192, 127>>.

-compile({nowarn_unused_function,e_type_double/3}).
e_type_double(V, Bin, _) when is_number(V) -> <<Bin/binary, V:64/little-float>>;
e_type_double(infinity, Bin, _) -> <<Bin/binary, 0:48, 240, 127>>;
e_type_double('-infinity', Bin, _) -> <<Bin/binary, 0:48, 240, 255>>;
e_type_double(nan, Bin, _) -> <<Bin/binary, 0:48, 248, 127>>.

-compile({nowarn_unused_function,e_varint/3}).
e_varint(N, Bin, _TrUserData) -> e_varint(N, Bin).

-compile({nowarn_unused_function,e_varint/2}).
e_varint(N, Bin) when N =< 127 -> <<Bin/binary, N>>;
e_varint(N, Bin) ->
    Bin2 = <<Bin/binary, (N band 127 bor 128)>>,
    e_varint(N bsr 7, Bin2).


decode_msg(Bin, MsgName) when is_binary(Bin) -> decode_msg(Bin, MsgName, []).

decode_msg(Bin, MsgName, Opts) when is_binary(Bin) ->
    TrUserData = proplists:get_value(user_data, Opts),
    decode_msg_1_catch(Bin, MsgName, TrUserData).

-ifdef('OTP_RELEASE').
decode_msg_1_catch(Bin, MsgName, TrUserData) ->
    try decode_msg_2_doit(MsgName, Bin, TrUserData)
    catch Class:Reason:StackTrace -> error({gpb_error,{decoding_failure, {Bin, MsgName, {Class, Reason, StackTrace}}}})
    end.
-else.
decode_msg_1_catch(Bin, MsgName, TrUserData) ->
    try decode_msg_2_doit(MsgName, Bin, TrUserData)
    catch Class:Reason ->
        StackTrace = erlang:get_stacktrace(),
        error({gpb_error,{decoding_failure, {Bin, MsgName, {Class, Reason, StackTrace}}}})
    end.
-endif.

decode_msg_2_doit(pb_noise_message, Bin, TrUserData) -> id(decode_msg_pb_noise_message(Bin, TrUserData), TrUserData).



decode_msg_pb_noise_message(Bin, TrUserData) -> dfp_read_field_def_pb_noise_message(Bin, 0, 0, id('XX_A', TrUserData), id(<<>>, TrUserData), TrUserData).

dfp_read_field_def_pb_noise_message(<<8, Rest/binary>>, Z1, Z2, F@_1, F@_2, TrUserData) -> d_field_pb_noise_message_message_type(Rest, Z1, Z2, F@_1, F@_2, TrUserData);
dfp_read_field_def_pb_noise_message(<<18, Rest/binary>>, Z1, Z2, F@_1, F@_2, TrUserData) -> d_field_pb_noise_message_content(Rest, Z1, Z2, F@_1, F@_2, TrUserData);
dfp_read_field_def_pb_noise_message(<<>>, 0, 0, F@_1, F@_2, _) -> #pb_noise_message{message_type = F@_1, content = F@_2};
dfp_read_field_def_pb_noise_message(Other, Z1, Z2, F@_1, F@_2, TrUserData) -> dg_read_field_def_pb_noise_message(Other, Z1, Z2, F@_1, F@_2, TrUserData).

dg_read_field_def_pb_noise_message(<<1:1, X:7, Rest/binary>>, N, Acc, F@_1, F@_2, TrUserData) when N < 32 - 7 -> dg_read_field_def_pb_noise_message(Rest, N + 7, X bsl N + Acc, F@_1, F@_2, TrUserData);
dg_read_field_def_pb_noise_message(<<0:1, X:7, Rest/binary>>, N, Acc, F@_1, F@_2, TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
        8 -> d_field_pb_noise_message_message_type(Rest, 0, 0, F@_1, F@_2, TrUserData);
        18 -> d_field_pb_noise_message_content(Rest, 0, 0, F@_1, F@_2, TrUserData);
        _ ->
            case Key band 7 of
                0 -> skip_varint_pb_noise_message(Rest, 0, 0, F@_1, F@_2, TrUserData);
                1 -> skip_64_pb_noise_message(Rest, 0, 0, F@_1, F@_2, TrUserData);
                2 -> skip_length_delimited_pb_noise_message(Rest, 0, 0, F@_1, F@_2, TrUserData);
                3 -> skip_group_pb_noise_message(Rest, Key bsr 3, 0, F@_1, F@_2, TrUserData);
                5 -> skip_32_pb_noise_message(Rest, 0, 0, F@_1, F@_2, TrUserData)
            end
    end;
dg_read_field_def_pb_noise_message(<<>>, 0, 0, F@_1, F@_2, _) -> #pb_noise_message{message_type = F@_1, content = F@_2}.

d_field_pb_noise_message_message_type(<<1:1, X:7, Rest/binary>>, N, Acc, F@_1, F@_2, TrUserData) when N < 57 -> d_field_pb_noise_message_message_type(Rest, N + 7, X bsl N + Acc, F@_1, F@_2, TrUserData);
d_field_pb_noise_message_message_type(<<0:1, X:7, Rest/binary>>, N, Acc, _, F@_2, TrUserData) ->
    {NewFValue, RestF} = {id('d_enum_pb_noise_message.MessageType'(begin <<Res:32/signed-native>> = <<(X bsl N + Acc):32/unsigned-native>>, id(Res, TrUserData) end), TrUserData), Rest},
    dfp_read_field_def_pb_noise_message(RestF, 0, 0, NewFValue, F@_2, TrUserData).

d_field_pb_noise_message_content(<<1:1, X:7, Rest/binary>>, N, Acc, F@_1, F@_2, TrUserData) when N < 57 -> d_field_pb_noise_message_content(Rest, N + 7, X bsl N + Acc, F@_1, F@_2, TrUserData);
d_field_pb_noise_message_content(<<0:1, X:7, Rest/binary>>, N, Acc, F@_1, _, TrUserData) ->
    {NewFValue, RestF} = begin Len = X bsl N + Acc, <<Bytes:Len/binary, Rest2/binary>> = Rest, {id(binary:copy(Bytes), TrUserData), Rest2} end,
    dfp_read_field_def_pb_noise_message(RestF, 0, 0, F@_1, NewFValue, TrUserData).

skip_varint_pb_noise_message(<<1:1, _:7, Rest/binary>>, Z1, Z2, F@_1, F@_2, TrUserData) -> skip_varint_pb_noise_message(Rest, Z1, Z2, F@_1, F@_2, TrUserData);
skip_varint_pb_noise_message(<<0:1, _:7, Rest/binary>>, Z1, Z2, F@_1, F@_2, TrUserData) -> dfp_read_field_def_pb_noise_message(Rest, Z1, Z2, F@_1, F@_2, TrUserData).

skip_length_delimited_pb_noise_message(<<1:1, X:7, Rest/binary>>, N, Acc, F@_1, F@_2, TrUserData) when N < 57 -> skip_length_delimited_pb_noise_message(Rest, N + 7, X bsl N + Acc, F@_1, F@_2, TrUserData);
skip_length_delimited_pb_noise_message(<<0:1, X:7, Rest/binary>>, N, Acc, F@_1, F@_2, TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_pb_noise_message(Rest2, 0, 0, F@_1, F@_2, TrUserData).

skip_group_pb_noise_message(Bin, FNum, Z2, F@_1, F@_2, TrUserData) ->
    {_, Rest} = read_group(Bin, FNum),
    dfp_read_field_def_pb_noise_message(Rest, 0, Z2, F@_1, F@_2, TrUserData).

skip_32_pb_noise_message(<<_:32, Rest/binary>>, Z1, Z2, F@_1, F@_2, TrUserData) -> dfp_read_field_def_pb_noise_message(Rest, Z1, Z2, F@_1, F@_2, TrUserData).

skip_64_pb_noise_message(<<_:64, Rest/binary>>, Z1, Z2, F@_1, F@_2, TrUserData) -> dfp_read_field_def_pb_noise_message(Rest, Z1, Z2, F@_1, F@_2, TrUserData).

'd_enum_pb_noise_message.MessageType'(0) -> 'XX_A';
'd_enum_pb_noise_message.MessageType'(1) -> 'XX_B';
'd_enum_pb_noise_message.MessageType'(2) -> 'XX_C';
'd_enum_pb_noise_message.MessageType'(3) -> 'IK_A';
'd_enum_pb_noise_message.MessageType'(4) -> 'IK_B';
'd_enum_pb_noise_message.MessageType'(5) -> 'XX_FALLBACK_A';
'd_enum_pb_noise_message.MessageType'(6) -> 'XX_FALLBACK_B';
'd_enum_pb_noise_message.MessageType'(V) -> V.

read_group(Bin, FieldNum) ->
    {NumBytes, EndTagLen} = read_gr_b(Bin, 0, 0, 0, 0, FieldNum),
    <<Group:NumBytes/binary, _:EndTagLen/binary, Rest/binary>> = Bin,
    {Group, Rest}.

%% Like skipping over fields, but record the total length,
%% Each field is <(FieldNum bsl 3) bor FieldType> ++ <FieldValue>
%% Record the length because varints may be non-optimally encoded.
%%
%% Groups can be nested, but assume the same FieldNum cannot be nested
%% because group field numbers are shared with the rest of the fields
%% numbers. Thus we can search just for an group-end with the same
%% field number.
%%
%% (The only time the same group field number could occur would
%% be in a nested sub message, but then it would be inside a
%% length-delimited entry, which we skip-read by length.)
read_gr_b(<<1:1, X:7, Tl/binary>>, N, Acc, NumBytes, TagLen, FieldNum)
  when N < (32-7) ->
    read_gr_b(Tl, N+7, X bsl N + Acc, NumBytes, TagLen+1, FieldNum);
read_gr_b(<<0:1, X:7, Tl/binary>>, N, Acc, NumBytes, TagLen,
          FieldNum) ->
    Key = X bsl N + Acc,
    TagLen1 = TagLen + 1,
    case {Key bsr 3, Key band 7} of
        {FieldNum, 4} -> % 4 = group_end
            {NumBytes, TagLen1};
        {_, 0} -> % 0 = varint
            read_gr_vi(Tl, 0, NumBytes + TagLen1, FieldNum);
        {_, 1} -> % 1 = bits64
            <<_:64, Tl2/binary>> = Tl,
            read_gr_b(Tl2, 0, 0, NumBytes + TagLen1 + 8, 0, FieldNum);
        {_, 2} -> % 2 = length_delimited
            read_gr_ld(Tl, 0, 0, NumBytes + TagLen1, FieldNum);
        {_, 3} -> % 3 = group_start
            read_gr_b(Tl, 0, 0, NumBytes + TagLen1, 0, FieldNum);
        {_, 4} -> % 4 = group_end
            read_gr_b(Tl, 0, 0, NumBytes + TagLen1, 0, FieldNum);
        {_, 5} -> % 5 = bits32
            <<_:32, Tl2/binary>> = Tl,
            read_gr_b(Tl2, 0, 0, NumBytes + TagLen1 + 4, 0, FieldNum)
    end.

read_gr_vi(<<1:1, _:7, Tl/binary>>, N, NumBytes, FieldNum)
  when N < (64-7) ->
    read_gr_vi(Tl, N+7, NumBytes+1, FieldNum);
read_gr_vi(<<0:1, _:7, Tl/binary>>, _, NumBytes, FieldNum) ->
    read_gr_b(Tl, 0, 0, NumBytes+1, 0, FieldNum).

read_gr_ld(<<1:1, X:7, Tl/binary>>, N, Acc, NumBytes, FieldNum)
  when N < (64-7) ->
    read_gr_ld(Tl, N+7, X bsl N + Acc, NumBytes+1, FieldNum);
read_gr_ld(<<0:1, X:7, Tl/binary>>, N, Acc, NumBytes, FieldNum) ->
    Len = X bsl N + Acc,
    NumBytes1 = NumBytes + 1,
    <<_:Len/binary, Tl2/binary>> = Tl,
    read_gr_b(Tl2, 0, 0, NumBytes1 + Len, 0, FieldNum).

merge_msgs(Prev, New) when element(1, Prev) =:= element(1, New) -> merge_msgs(Prev, New, element(1, Prev), []).

merge_msgs(Prev, New, MsgName) when is_atom(MsgName) -> merge_msgs(Prev, New, MsgName, []);
merge_msgs(Prev, New, Opts) when element(1, Prev) =:= element(1, New), is_list(Opts) -> merge_msgs(Prev, New, element(1, Prev), Opts).

merge_msgs(Prev, New, MsgName, Opts) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case MsgName of pb_noise_message -> merge_msg_pb_noise_message(Prev, New, TrUserData) end.

-compile({nowarn_unused_function,merge_msg_pb_noise_message/3}).
merge_msg_pb_noise_message(#pb_noise_message{message_type = PFmessage_type, content = PFcontent}, #pb_noise_message{message_type = NFmessage_type, content = NFcontent}, _) ->
    #pb_noise_message{message_type =
                          if NFmessage_type =:= undefined -> PFmessage_type;
                             true -> NFmessage_type
                          end,
                      content =
                          if NFcontent =:= undefined -> PFcontent;
                             true -> NFcontent
                          end}.


verify_msg(Msg) when tuple_size(Msg) >= 1 -> verify_msg(Msg, element(1, Msg), []);
verify_msg(X) -> mk_type_error(not_a_known_message, X, []).

verify_msg(Msg, MsgName) when is_atom(MsgName) -> verify_msg(Msg, MsgName, []);
verify_msg(Msg, Opts) when tuple_size(Msg) >= 1 -> verify_msg(Msg, element(1, Msg), Opts);
verify_msg(X, _Opts) -> mk_type_error(not_a_known_message, X, []).

verify_msg(Msg, MsgName, Opts) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case MsgName of
        pb_noise_message -> v_msg_pb_noise_message(Msg, [MsgName], TrUserData);
        _ -> mk_type_error(not_a_known_message, Msg, [])
    end.


-compile({nowarn_unused_function,v_msg_pb_noise_message/3}).
-dialyzer({nowarn_function,v_msg_pb_noise_message/3}).
v_msg_pb_noise_message(#pb_noise_message{message_type = F1, content = F2}, Path, TrUserData) ->
    if F1 == undefined -> ok;
       true -> 'v_enum_pb_noise_message.MessageType'(F1, [message_type | Path], TrUserData)
    end,
    if F2 == undefined -> ok;
       true -> v_type_bytes(F2, [content | Path], TrUserData)
    end,
    ok;
v_msg_pb_noise_message(X, Path, _TrUserData) -> mk_type_error({expected_msg, pb_noise_message}, X, Path).

-compile({nowarn_unused_function,'v_enum_pb_noise_message.MessageType'/3}).
-dialyzer({nowarn_function,'v_enum_pb_noise_message.MessageType'/3}).
'v_enum_pb_noise_message.MessageType'('XX_A', _Path, _TrUserData) -> ok;
'v_enum_pb_noise_message.MessageType'('XX_B', _Path, _TrUserData) -> ok;
'v_enum_pb_noise_message.MessageType'('XX_C', _Path, _TrUserData) -> ok;
'v_enum_pb_noise_message.MessageType'('IK_A', _Path, _TrUserData) -> ok;
'v_enum_pb_noise_message.MessageType'('IK_B', _Path, _TrUserData) -> ok;
'v_enum_pb_noise_message.MessageType'('XX_FALLBACK_A', _Path, _TrUserData) -> ok;
'v_enum_pb_noise_message.MessageType'('XX_FALLBACK_B', _Path, _TrUserData) -> ok;
'v_enum_pb_noise_message.MessageType'(V, Path, TrUserData) when is_integer(V) -> v_type_sint32(V, Path, TrUserData);
'v_enum_pb_noise_message.MessageType'(X, Path, _TrUserData) -> mk_type_error({invalid_enum, 'pb_noise_message.MessageType'}, X, Path).

-compile({nowarn_unused_function,v_type_sint32/3}).
-dialyzer({nowarn_function,v_type_sint32/3}).
v_type_sint32(N, _Path, _TrUserData) when -2147483648 =< N, N =< 2147483647 -> ok;
v_type_sint32(N, Path, _TrUserData) when is_integer(N) -> mk_type_error({value_out_of_range, sint32, signed, 32}, N, Path);
v_type_sint32(X, Path, _TrUserData) -> mk_type_error({bad_integer, sint32, signed, 32}, X, Path).

-compile({nowarn_unused_function,v_type_bytes/3}).
-dialyzer({nowarn_function,v_type_bytes/3}).
v_type_bytes(B, _Path, _TrUserData) when is_binary(B) -> ok;
v_type_bytes(B, _Path, _TrUserData) when is_list(B) -> ok;
v_type_bytes(X, Path, _TrUserData) -> mk_type_error(bad_binary_value, X, Path).

-compile({nowarn_unused_function,mk_type_error/3}).
-spec mk_type_error(_, _, list()) -> no_return().
mk_type_error(Error, ValueSeen, Path) ->
    Path2 = prettify_path(Path),
    erlang:error({gpb_type_error, {Error, [{value, ValueSeen}, {path, Path2}]}}).


-compile({nowarn_unused_function,prettify_path/1}).
-dialyzer({nowarn_function,prettify_path/1}).
prettify_path([]) -> top_level;
prettify_path(PathR) -> list_to_atom(lists:append(lists:join(".", lists:map(fun atom_to_list/1, lists:reverse(PathR))))).


-compile({nowarn_unused_function,id/2}).
-compile({inline,id/2}).
id(X, _TrUserData) -> X.

-compile({nowarn_unused_function,v_ok/3}).
-compile({inline,v_ok/3}).
v_ok(_Value, _Path, _TrUserData) -> ok.

-compile({nowarn_unused_function,m_overwrite/3}).
-compile({inline,m_overwrite/3}).
m_overwrite(_Prev, New, _TrUserData) -> New.

-compile({nowarn_unused_function,cons/3}).
-compile({inline,cons/3}).
cons(Elem, Acc, _TrUserData) -> [Elem | Acc].

-compile({nowarn_unused_function,lists_reverse/2}).
-compile({inline,lists_reverse/2}).
'lists_reverse'(L, _TrUserData) -> lists:reverse(L).
-compile({nowarn_unused_function,'erlang_++'/3}).
-compile({inline,'erlang_++'/3}).
'erlang_++'(A, B, _TrUserData) -> A ++ B.


get_msg_defs() ->
    [{{enum, 'pb_noise_message.MessageType'}, [{'XX_A', 0}, {'XX_B', 1}, {'XX_C', 2}, {'IK_A', 3}, {'IK_B', 4}, {'XX_FALLBACK_A', 5}, {'XX_FALLBACK_B', 6}]},
     {{msg, pb_noise_message},
      [#field{name = message_type, fnum = 1, rnum = 2, type = {enum, 'pb_noise_message.MessageType'}, occurrence = optional, opts = []}, #field{name = content, fnum = 2, rnum = 3, type = bytes, occurrence = optional, opts = []}]}].


get_msg_names() -> [pb_noise_message].


get_group_names() -> [].


get_msg_or_group_names() -> [pb_noise_message].


get_enum_names() -> ['pb_noise_message.MessageType'].


fetch_msg_def(MsgName) ->
    case find_msg_def(MsgName) of
        Fs when is_list(Fs) -> Fs;
        error -> erlang:error({no_such_msg, MsgName})
    end.


fetch_enum_def(EnumName) ->
    case find_enum_def(EnumName) of
        Es when is_list(Es) -> Es;
        error -> erlang:error({no_such_enum, EnumName})
    end.


find_msg_def(pb_noise_message) ->
    [#field{name = message_type, fnum = 1, rnum = 2, type = {enum, 'pb_noise_message.MessageType'}, occurrence = optional, opts = []}, #field{name = content, fnum = 2, rnum = 3, type = bytes, occurrence = optional, opts = []}];
find_msg_def(_) -> error.


find_enum_def('pb_noise_message.MessageType') -> [{'XX_A', 0}, {'XX_B', 1}, {'XX_C', 2}, {'IK_A', 3}, {'IK_B', 4}, {'XX_FALLBACK_A', 5}, {'XX_FALLBACK_B', 6}];
find_enum_def(_) -> error.


enum_symbol_by_value('pb_noise_message.MessageType', Value) -> 'enum_symbol_by_value_pb_noise_message.MessageType'(Value).


enum_value_by_symbol('pb_noise_message.MessageType', Sym) -> 'enum_value_by_symbol_pb_noise_message.MessageType'(Sym).


'enum_symbol_by_value_pb_noise_message.MessageType'(0) -> 'XX_A';
'enum_symbol_by_value_pb_noise_message.MessageType'(1) -> 'XX_B';
'enum_symbol_by_value_pb_noise_message.MessageType'(2) -> 'XX_C';
'enum_symbol_by_value_pb_noise_message.MessageType'(3) -> 'IK_A';
'enum_symbol_by_value_pb_noise_message.MessageType'(4) -> 'IK_B';
'enum_symbol_by_value_pb_noise_message.MessageType'(5) -> 'XX_FALLBACK_A';
'enum_symbol_by_value_pb_noise_message.MessageType'(6) -> 'XX_FALLBACK_B'.


'enum_value_by_symbol_pb_noise_message.MessageType'('XX_A') -> 0;
'enum_value_by_symbol_pb_noise_message.MessageType'('XX_B') -> 1;
'enum_value_by_symbol_pb_noise_message.MessageType'('XX_C') -> 2;
'enum_value_by_symbol_pb_noise_message.MessageType'('IK_A') -> 3;
'enum_value_by_symbol_pb_noise_message.MessageType'('IK_B') -> 4;
'enum_value_by_symbol_pb_noise_message.MessageType'('XX_FALLBACK_A') -> 5;
'enum_value_by_symbol_pb_noise_message.MessageType'('XX_FALLBACK_B') -> 6.


get_service_names() -> [].


get_service_def(_) -> error.


get_rpc_names(_) -> error.


find_rpc_def(_, _) -> error.



-spec fetch_rpc_def(_, _) -> no_return().
fetch_rpc_def(ServiceName, RpcName) -> erlang:error({no_such_rpc, ServiceName, RpcName}).


%% Convert a a fully qualified (ie with package name) service name
%% as a binary to a service name as an atom.
-spec fqbin_to_service_name(_) -> no_return().
fqbin_to_service_name(X) -> error({gpb_error, {badservice, X}}).


%% Convert a service name as an atom to a fully qualified
%% (ie with package name) name as a binary.
-spec service_name_to_fqbin(_) -> no_return().
service_name_to_fqbin(X) -> error({gpb_error, {badservice, X}}).


%% Convert a a fully qualified (ie with package name) service name
%% and an rpc name, both as binaries to a service name and an rpc
%% name, as atoms.
-spec fqbins_to_service_and_rpc_name(_, _) -> no_return().
fqbins_to_service_and_rpc_name(S, R) -> error({gpb_error, {badservice_or_rpc, {S, R}}}).


%% Convert a service name and an rpc name, both as atoms,
%% to a fully qualified (ie with package name) service name and
%% an rpc name as binaries.
-spec service_and_rpc_name_to_fqbins(_, _) -> no_return().
service_and_rpc_name_to_fqbins(S, R) -> error({gpb_error, {badservice_or_rpc, {S, R}}}).


fqbin_to_msg_name(<<"noise_server.NoiseMessage">>) -> pb_noise_message;
fqbin_to_msg_name(E) -> error({gpb_error, {badmsg, E}}).


msg_name_to_fqbin(pb_noise_message) -> <<"noise_server.NoiseMessage">>;
msg_name_to_fqbin(E) -> error({gpb_error, {badmsg, E}}).


fqbin_to_enum_name(<<"noise_server.NoiseMessage.MessageType">>) -> 'pb_noise_message.MessageType';
fqbin_to_enum_name(E) -> error({gpb_error, {badenum, E}}).


enum_name_to_fqbin('pb_noise_message.MessageType') -> <<"noise_server.NoiseMessage.MessageType">>;
enum_name_to_fqbin(E) -> error({gpb_error, {badenum, E}}).


get_package_name() -> noise_server.


%% Whether or not the message names
%% are prepended with package name or not.
uses_packages() -> false.


source_basename() -> "noise_server.proto".


%% Retrieve all proto file names, also imported ones.
%% The order is top-down. The first element is always the main
%% source file. The files are returned with extension,
%% see get_all_proto_names/0 for a version that returns
%% the basenames sans extension
get_all_source_basenames() -> ["noise_server.proto"].


%% Retrieve all proto file names, also imported ones.
%% The order is top-down. The first element is always the main
%% source file. The files are returned sans .proto extension,
%% to make it easier to use them with the various get_xyz_containment
%% functions.
get_all_proto_names() -> ["noise_server"].


get_msg_containment("noise_server") -> [pb_noise_message];
get_msg_containment(P) -> error({gpb_error, {badproto, P}}).


get_pkg_containment("noise_server") -> undefined;
get_pkg_containment(P) -> error({gpb_error, {badproto, P}}).


get_service_containment("noise_server") -> [];
get_service_containment(P) -> error({gpb_error, {badproto, P}}).


get_rpc_containment("noise_server") -> [];
get_rpc_containment(P) -> error({gpb_error, {badproto, P}}).


get_enum_containment("noise_server") -> ['pb_noise_message.MessageType'];
get_enum_containment(P) -> error({gpb_error, {badproto, P}}).


get_proto_by_msg_name_as_fqbin(<<"noise_server.NoiseMessage">>) -> "noise_server";
get_proto_by_msg_name_as_fqbin(E) -> error({gpb_error, {badmsg, E}}).


-spec get_proto_by_service_name_as_fqbin(_) -> no_return().
get_proto_by_service_name_as_fqbin(E) -> error({gpb_error, {badservice, E}}).


get_proto_by_enum_name_as_fqbin(<<"noise_server.NoiseMessage.MessageType">>) -> "noise_server";
get_proto_by_enum_name_as_fqbin(E) -> error({gpb_error, {badenum, E}}).


-spec get_protos_by_pkg_name_as_fqbin(_) -> no_return().
get_protos_by_pkg_name_as_fqbin(E) -> error({gpb_error, {badpkg, E}}).



gpb_version_as_string() ->
    "4.14.1".

gpb_version_as_list() ->
    [4,14,1].
