
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __java_util_concurrent_ConcurrentHashMap__
#define __java_util_concurrent_ConcurrentHashMap__

#pragma interface

#include <java/util/AbstractMap.h>
#include <gcj/array.h>


class java::util::concurrent::ConcurrentHashMap : public ::java::util::AbstractMap
{

  static jint hash(jint);
public: // actually package-private
  virtual ::java::util::concurrent::ConcurrentHashMap$Segment * segmentFor(jint);
public:
  ConcurrentHashMap(jint, jfloat, jint);
  ConcurrentHashMap(jint, jfloat);
  ConcurrentHashMap(jint);
  ConcurrentHashMap();
  ConcurrentHashMap(::java::util::Map *);
  virtual jboolean isEmpty();
  virtual jint size();
  virtual ::java::lang::Object * get(::java::lang::Object *);
  virtual jboolean containsKey(::java::lang::Object *);
  virtual jboolean containsValue(::java::lang::Object *);
  virtual jboolean contains(::java::lang::Object *);
  virtual ::java::lang::Object * put(::java::lang::Object *, ::java::lang::Object *);
  virtual ::java::lang::Object * putIfAbsent(::java::lang::Object *, ::java::lang::Object *);
  virtual void putAll(::java::util::Map *);
  virtual ::java::lang::Object * remove(::java::lang::Object *);
  virtual jboolean remove(::java::lang::Object *, ::java::lang::Object *);
  virtual jboolean replace(::java::lang::Object *, ::java::lang::Object *, ::java::lang::Object *);
  virtual ::java::lang::Object * replace(::java::lang::Object *, ::java::lang::Object *);
  virtual void clear();
  virtual ::java::util::Set * keySet();
  virtual ::java::util::Collection * values();
  virtual ::java::util::Set * entrySet();
  virtual ::java::util::Enumeration * keys();
  virtual ::java::util::Enumeration * elements();
private:
  void writeObject(::java::io::ObjectOutputStream *);
  void readObject(::java::io::ObjectInputStream *);
  static const jlong serialVersionUID = 7249069246763182397LL;
public: // actually package-private
  static const jint DEFAULT_INITIAL_CAPACITY = 16;
  static jfloat DEFAULT_LOAD_FACTOR;
  static const jint DEFAULT_CONCURRENCY_LEVEL = 16;
  static const jint MAXIMUM_CAPACITY = 1073741824;
  static const jint MAX_SEGMENTS = 65536;
  static const jint RETRIES_BEFORE_LOCK = 2;
  jint __attribute__((aligned(__alignof__( ::java::util::AbstractMap)))) segmentMask;
  jint segmentShift;
  JArray< ::java::util::concurrent::ConcurrentHashMap$Segment * > * segments;
  ::java::util::Set * keySet__;
  ::java::util::Set * entrySet__;
  ::java::util::Collection * values__;
public:
  static ::java::lang::Class class$;
};

#endif // __java_util_concurrent_ConcurrentHashMap__