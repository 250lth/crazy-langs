%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十月 2017 下午8:27
%%%-------------------------------------------------------------------
-module(exceptions).
-author("lth").

%% API
-export([throws/1, errors/1, exits/1, sword/1, black_knight/1, talk/0, whoa/0, im_impressed/0]).

throws(F) ->
  try F() of
    _ -> ok
  catch
    Throw -> {throw, caught, Throw}
  end.

errors(F) ->
  try F() of
    _ -> ok
  catch
    error:Error -> {error, caught, Error}
  end.

exits(F) ->
  try F() of
    _ -> ok
  catch
    exit:Exit -> {exit, caught, Exit}
  end.

sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);
sword(4) -> throws(punch);
sword(5) -> exit(cross_bridge).

black_knight(Attack) when is_function(Attack, 0) ->
  try Attack() of
    _ -> "None shall pass."
  catch
    throw:slice -> "It is but a scratch.";
    error:cut_arm -> "I've had worse.";
    exit:cut_leg -> "Come on you pansy!";
    _:_ -> "Just a flesh wound."
  end.

talk() -> "blah blah".

%% multi expressions
whoa() ->
  try
    talk(),
      _Knight = "None shall pass!",
      _Doubles = [N*2 || N <- lists:seq(1,100)],
      throw(up),
      _WillReturnThis = tequila
  of
    tequila -> "Hey, this worked!"
  catch
    Exception:Reason -> {caught, Exception, Reason}
  end.

im_impressed() ->
  try
    talk(),
      _Knight = "None shall pass!",
      _Doubles = [N*2 || N <- lists:seq(1, 100)],
      throw(up),
      _WillReturnThis = tequila
  catch
    Exception:Reason -> {caught, Exception, Reason}
  end.