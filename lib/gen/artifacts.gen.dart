// GENERATED – do not modify by hand

// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: constant_identifier_names
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: unused_element
import "package:llme/main.dart";import "dart:core";import "package:artifact/artifact.dart";
typedef _0=ArtifactCodecUtil;typedef _1=Map<String, dynamic>;typedef _2=List<String>;typedef _3=String;typedef _4=dynamic;typedef _5=int;typedef _6=ConfettiToolSchema;typedef _7=ConfettiColor;typedef _8=ConfettiCheck;typedef _9=List;typedef _a=List<ConfettiColor>;typedef _b=bool;typedef _c=ArgumentError;typedef _d=List<dynamic>;
const _2 _S=['colors','type','object','properties','array','items','description','An array of colors to be used for the confetti particles.','required','additionalProperties','Missing required ConfettiColor."r" in map ','Missing required ConfettiColor."g" in map ','Missing required ConfettiColor."b" in map ','integer','The red channel value for the color (0-255).','The green channel value for the color (0-255).','The blue channel value for the color (0-255).','played','boolean','Indicates if confetti was successfully played.'];const _d _V=[<_7>[],false];const _b _T=true;const _b _F=false;const _5 _ = 0;
extension $ConfettiToolSchema on _6{
  _6 get _H=>this;
  _3 toJson({bool pretty=_F})=>_0.j(pretty, toMap);
  _1 toMap(){_;return <_3, _4>{_S[0]:colors.$m((e)=> e.toMap()).$l,}.$nn;}
  static _6 fromJson(String j)=>fromMap(_0.o(j));
  static _6 fromMap(_1 r){_;_1 m=r.$nn;return _6(colors: m.$c(_S[0]) ?  (m[_S[0]] as _9).$m((e)=>$ConfettiColor.fromMap((e) as _1)).$l : _V[0],);}
  _6 copyWith({_a? colors,_b resetColors=_F,_a? appendColors,_a? removeColors,})=>_6(colors: ((resetColors?_V[0]:(colors??_H.colors)) as _a).$u(appendColors,removeColors),);
  static Map<String, dynamic> get schema=>{_S[1]:_S[2],_S[3]:{_S[0]:{_S[1]:_S[4],_S[5]:{...$ConfettiColor.schema,},_S[6]:_S[7],},},_S[8]:[_S[0]],_S[9]:_F};
}
extension $ConfettiColor on _7{
  _7 get _H=>this;
  _3 toJson({bool pretty=_F})=>_0.j(pretty, toMap);
  _1 toMap(){_;return <_3, _4>{'r':_0.ea(r),'g':_0.ea(g),'b':_0.ea(b),}.$nn;}
  static _7 fromJson(String j)=>fromMap(_0.o(j));
  static _7 fromMap(_1 r){_;_1 m=r.$nn;return _7(r: m.$c('r')? _0.da(m['r'], _5) as _5:(throw _c('${_S[10]}$m.')),g: m.$c('g')? _0.da(m['g'], _5) as _5:(throw _c('${_S[11]}$m.')),b: m.$c('b')? _0.da(m['b'], _5) as _5:(throw _c('${_S[12]}$m.')),);}
  _7 copyWith({_5? r,_5? deltaR,_5? g,_5? deltaG,_5? b,_5? deltaB,})=>_7(r: deltaR!=null?(r??_H.r)+deltaR:r??_H.r,g: deltaG!=null?(g??_H.g)+deltaG:g??_H.g,b: deltaB!=null?(b??_H.b)+deltaB:b??_H.b,);
  static Map<String, dynamic> get schema=>{_S[1]:_S[2],_S[3]:{'r':{_S[1]:_S[13],_S[6]:_S[14],},'g':{_S[1]:_S[13],_S[6]:_S[15],},'b':{_S[1]:_S[13],_S[6]:_S[16],},},_S[8]:['r','g','b'],_S[9]:_F};
}
extension $ConfettiCheck on _8{
  _8 get _H=>this;
  _3 toJson({bool pretty=_F})=>_0.j(pretty, toMap);
  _1 toMap(){_;return <_3, _4>{_S[17]:_0.ea(played),}.$nn;}
  static _8 fromJson(String j)=>fromMap(_0.o(j));
  static _8 fromMap(_1 r){_;_1 m=r.$nn;return _8(played: m.$c(_S[17]) ?  _0.da(m[_S[17]], _b) as _b : _V[1],);}
  _8 copyWith({_b? played,_b resetPlayed=_F,})=>_8(played: resetPlayed?_V[1]:(played??_H.played),);
  static Map<String, dynamic> get schema=>{_S[1]:_S[2],_S[3]:{_S[17]:{_S[1]:_S[18],_S[6]:_S[19],},},_S[8]:[_S[17]],_S[9]:_F};
}

