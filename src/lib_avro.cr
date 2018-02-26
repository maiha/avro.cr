@[Link("avro")]
lib LibAvro
  fun avro_set_allocator(alloc : AvroAllocatorT, user_data : Void*)
  alias AvroAllocatorT = (Void*, Void*, LibC::Int, LibC::Int -> Void*)
  struct AvroAllocatorState
    alloc : AvroAllocatorT
    user_data : Void*
  end
  fun avro_calloc(count : LibC::Int, size : LibC::Int) : Void*
  fun avro_str_alloc(str_size : LibC::Int) : LibC::Char*
  fun avro_strdup(str : LibC::Char*) : LibC::Char*
  fun avro_strndup(str : LibC::Char*, size : LibC::Int) : LibC::Char*
  fun avro_str_free(str : LibC::Char*)
  struct AvroObjT
    type : AvroTypeT
    class_type : AvroClassT
    refcount : LibC::Int
  end
  enum AvroTypeT
    AvroString = 0
    AvroBytes = 1
    AvroInt32 = 2
    AvroInt64 = 3
    AvroFloat = 4
    AvroDouble = 5
    AvroBoolean = 6
    AvroNull = 7
    AvroRecord = 8
    AvroEnum = 9
    AvroFixed = 10
    AvroMap = 11
    AvroArray = 12
    AvroUnion = 13
    AvroLink = 14
  end
  enum AvroClassT
    AvroSchema = 0
    AvroDatum = 1
  end
  struct AvroRawArray
    element_size : LibC::Int
    element_count : LibC::Int
    allocated_size : LibC::Int
    data : Void*
  end
  fun avro_raw_array_init(array : AvroRawArrayT*, element_size : LibC::Int)
  type AvroRawArrayT = AvroRawArray
  fun avro_raw_array_done(array : AvroRawArrayT*)
  fun avro_raw_array_clear(array : AvroRawArrayT*)
  fun avro_raw_array_ensure_size(array : AvroRawArrayT*, desired_count : LibC::Int) : LibC::Int
  fun avro_raw_array_ensure_size0(array : AvroRawArrayT*, desired_count : LibC::Int) : LibC::Int
  fun avro_raw_array_append(array : AvroRawArrayT*) : Void*
  struct AvroRawMapEntry
    key : LibC::Char*
  end
  struct AvroRawMap
    elements : AvroRawArrayT
    indices_by_key : Void*
  end
  fun avro_raw_map_init(map : AvroRawMapT*, element_size : LibC::Int)
  type AvroRawMapT = AvroRawMap
  fun avro_raw_map_done(map : AvroRawMapT*)
  fun avro_raw_map_clear(map : AvroRawMapT*)
  fun avro_raw_map_ensure_size(map : AvroRawMapT*, desired_count : LibC::Int) : LibC::Int
  fun avro_raw_map_get(map : AvroRawMapT*, key : LibC::Char*, index : LibC::Int*) : Void*
  fun avro_raw_map_get_or_create(map : AvroRawMapT*, key : LibC::Char*, element : Void**, index : LibC::Int*) : LibC::Int
  struct AvroWrappedBuffer
    buf : Void*
    size : LibC::Int
    user_data : Void*
    free : (AvroWrappedBufferT* -> Void)
    copy : (AvroWrappedBufferT*, AvroWrappedBufferT*, LibC::Int, LibC::Int -> LibC::Int)
    slice : (AvroWrappedBufferT*, LibC::Int, LibC::Int -> LibC::Int)
  end
  type AvroWrappedBufferT = AvroWrappedBuffer
  fun avro_wrapped_buffer_move(dest : AvroWrappedBufferT*, src : AvroWrappedBufferT*)
  fun avro_wrapped_buffer_copy(dest : AvroWrappedBufferT*, src : AvroWrappedBufferT*, offset : LibC::Int, length : LibC::Int) : LibC::Int
  fun avro_wrapped_buffer_slice(self : AvroWrappedBufferT*, offset : LibC::Int, length : LibC::Int) : LibC::Int
  fun avro_wrapped_buffer_new(dest : AvroWrappedBufferT*, buf : Void*, length : LibC::Int) : LibC::Int
  fun avro_wrapped_buffer_new_copy(dest : AvroWrappedBufferT*, buf : Void*, length : LibC::Int) : LibC::Int
  struct AvroRawString
    wrapped : AvroWrappedBufferT
  end
  fun avro_raw_string_init(str : AvroRawStringT*)
  type AvroRawStringT = AvroRawString
  fun avro_raw_string_done(str : AvroRawStringT*)
  fun avro_raw_string_set_length(str : AvroRawStringT*, src : Void*, length : LibC::Int)
  fun avro_raw_string_set(str : AvroRawStringT*, src : LibC::Char*)
  fun avro_raw_string_append(str : AvroRawStringT*, src : LibC::Char*)
  fun avro_raw_string_append_length(str : AvroRawStringT*, src : Void*, length : LibC::Int)
  fun avro_raw_string_give(str : AvroRawStringT*, src : AvroWrappedBufferT*)
  fun avro_raw_string_grab(str : AvroRawStringT*, dest : AvroWrappedBufferT*) : LibC::Int
  fun avro_raw_string_clear(str : AvroRawStringT*)
  fun avro_raw_string_equals(str1 : AvroRawStringT*, str2 : AvroRawStringT*) : LibC::Int
  struct AvroMemoize
    cache : Void*
  end
  fun avro_memoize_init(mem : AvroMemoizeT*)
  type AvroMemoizeT = AvroMemoize
  fun avro_memoize_done(mem : AvroMemoizeT*)
  fun avro_memoize_get(mem : AvroMemoizeT*, key1 : Void*, key2 : Void*, result : Void**) : LibC::Int
  fun avro_memoize_set(mem : AvroMemoizeT*, key1 : Void*, key2 : Void*, result : Void*)
  fun avro_memoize_delete(mem : AvroMemoizeT*, key1 : Void*, key2 : Void*)
  fun avro_schema_string : AvroSchemaT
  alias AvroSchemaT = AvroObjT*
  fun avro_schema_bytes : AvroSchemaT
  fun avro_schema_int : AvroSchemaT
  fun avro_schema_long : AvroSchemaT
  fun avro_schema_float : AvroSchemaT
  fun avro_schema_double : AvroSchemaT
  fun avro_schema_boolean : AvroSchemaT
  fun avro_schema_null : AvroSchemaT
  fun avro_schema_record(name : LibC::Char*, space : LibC::Char*) : AvroSchemaT
  fun avro_schema_record_field_get(record : AvroSchemaT, field_name : LibC::Char*) : AvroSchemaT
  fun avro_schema_record_field_name(schema : AvroSchemaT, index : LibC::Int) : LibC::Char*
  fun avro_schema_record_field_get_index(schema : AvroSchemaT, field_name : LibC::Char*) : LibC::Int
  fun avro_schema_record_field_get_by_index(record : AvroSchemaT, index : LibC::Int) : AvroSchemaT
  fun avro_schema_record_field_append(record : AvroSchemaT, field_name : LibC::Char*, type : AvroSchemaT) : LibC::Int
  fun avro_schema_record_size : LibC::Int
  fun avro_schema_enum(name : LibC::Char*) : AvroSchemaT
  fun avro_schema_enum_ns(name : LibC::Char*, space : LibC::Char*) : AvroSchemaT
  fun avro_schema_enum_get(enump : AvroSchemaT, index : LibC::Int) : LibC::Char*
  fun avro_schema_enum_get_by_name(enump : AvroSchemaT, symbol_name : LibC::Char*) : LibC::Int
  fun avro_schema_enum_symbol_append(enump : AvroSchemaT, symbol : LibC::Char*) : LibC::Int
  fun avro_schema_fixed(name : LibC::Char*, len : Int64T) : AvroSchemaT
  alias Int64T = LibC::Long
  fun avro_schema_fixed_ns(name : LibC::Char*, space : LibC::Char*, len : Int64T) : AvroSchemaT
  fun avro_schema_fixed_size(fixed : AvroSchemaT) : Int64T
  fun avro_schema_map(values : AvroSchemaT) : AvroSchemaT
  fun avro_schema_map_values(map : AvroSchemaT) : AvroSchemaT
  fun avro_schema_array(items : AvroSchemaT) : AvroSchemaT
  fun avro_schema_array_items(array : AvroSchemaT) : AvroSchemaT
  fun avro_schema_union : AvroSchemaT
  fun avro_schema_union_size : LibC::Int
  fun avro_schema_union_append(union_schema : AvroSchemaT, schema : AvroSchemaT) : LibC::Int
  fun avro_schema_union_branch(union_schema : AvroSchemaT, branch_index : LibC::Int) : AvroSchemaT
  fun avro_schema_union_branch_by_name(union_schema : AvroSchemaT, branch_index : LibC::Int*, name : LibC::Char*) : AvroSchemaT
  fun avro_schema_link(schema : AvroSchemaT) : AvroSchemaT
  fun avro_schema_link_target(schema : AvroSchemaT) : AvroSchemaT
  fun avro_schema_from_json(jsontext : LibC::Char*, unused1 : Int32T, schema : AvroSchemaT*, unused2 : AvroSchemaErrorT*) : LibC::Int
  alias Int32T = LibC::Int
  type AvroSchemaErrorT = Void*
  fun avro_schema_from_json_length(jsontext : LibC::Char*, length : LibC::Int, schema : AvroSchemaT*) : LibC::Int
  fun avro_schema_to_specific(schema : AvroSchemaT, prefix : LibC::Char*) : LibC::Int
  fun avro_schema_get_subschema(schema : AvroSchemaT, name : LibC::Char*) : AvroSchemaT
  fun avro_schema_name(schema : AvroSchemaT) : LibC::Char*
  fun avro_schema_namespace(schema : AvroSchemaT) : LibC::Char*
  fun avro_schema_type_name(schema : AvroSchemaT) : LibC::Char*
  fun avro_schema_copy(schema : AvroSchemaT) : AvroSchemaT
  fun avro_schema_equal(a : AvroSchemaT, b : AvroSchemaT) : LibC::Int
  fun avro_schema_incref(schema : AvroSchemaT) : AvroSchemaT
  fun avro_schema_decref(schema : AvroSchemaT) : LibC::Int
  fun avro_schema_match(writers_schema : AvroSchemaT, readers_schema : AvroSchemaT) : LibC::Int
  struct AvroValueIface
    incref_iface : (AvroValueIfaceT* -> AvroValueIfaceT*)
    decref_iface : (AvroValueIfaceT* -> Void)
    incref : (AvroValueT* -> Void)
    decref : (AvroValueT* -> Void)
    reset : (AvroValueIfaceT*, Void* -> LibC::Int)
    get_type : (AvroValueIfaceT*, Void* -> AvroTypeT)
    get_schema : (AvroValueIfaceT*, Void* -> AvroSchemaT)
    get_boolean : (AvroValueIfaceT*, Void*, LibC::Int* -> LibC::Int)
    get_bytes : (AvroValueIfaceT*, Void*, Void**, LibC::Int* -> LibC::Int)
    grab_bytes : (AvroValueIfaceT*, Void*, AvroWrappedBufferT* -> LibC::Int)
    get_double : (AvroValueIfaceT*, Void*, LibC::Double* -> LibC::Int)
    get_float : (AvroValueIfaceT*, Void*, LibC::Float* -> LibC::Int)
    get_int : (AvroValueIfaceT*, Void*, Int32T* -> LibC::Int)
    get_long : (AvroValueIfaceT*, Void*, Int64T* -> LibC::Int)
    get_null : (AvroValueIfaceT*, Void* -> LibC::Int)
    get_string : (AvroValueIfaceT*, Void*, LibC::Char**, LibC::Int* -> LibC::Int)
    grab_string : (AvroValueIfaceT*, Void*, AvroWrappedBufferT* -> LibC::Int)
    get_enum : (AvroValueIfaceT*, Void*, LibC::Int* -> LibC::Int)
    get_fixed : (AvroValueIfaceT*, Void*, Void**, LibC::Int* -> LibC::Int)
    grab_fixed : (AvroValueIfaceT*, Void*, AvroWrappedBufferT* -> LibC::Int)
    set_boolean : (AvroValueIfaceT*, Void*, LibC::Int -> LibC::Int)
    set_bytes : (AvroValueIfaceT*, Void*, Void*, LibC::Int -> LibC::Int)
    give_bytes : (AvroValueIfaceT*, Void*, AvroWrappedBufferT* -> LibC::Int)
    set_double : (AvroValueIfaceT*, Void*, LibC::Double -> LibC::Int)
    set_float : (AvroValueIfaceT*, Void*, LibC::Float -> LibC::Int)
    set_int : (AvroValueIfaceT*, Void*, Int32T -> LibC::Int)
    set_long : (AvroValueIfaceT*, Void*, Int64T -> LibC::Int)
    set_null : (AvroValueIfaceT*, Void* -> LibC::Int)
    set_string : (AvroValueIfaceT*, Void*, LibC::Char* -> LibC::Int)
    set_string_len : (AvroValueIfaceT*, Void*, LibC::Char*, LibC::Int -> LibC::Int)
    give_string_len : (AvroValueIfaceT*, Void*, AvroWrappedBufferT* -> LibC::Int)
    set_enum : (AvroValueIfaceT*, Void*, LibC::Int -> LibC::Int)
    set_fixed : (AvroValueIfaceT*, Void*, Void*, LibC::Int -> LibC::Int)
    give_fixed : (AvroValueIfaceT*, Void*, AvroWrappedBufferT* -> LibC::Int)
    get_size : (AvroValueIfaceT*, Void*, LibC::Int* -> LibC::Int)
    get_by_index : (AvroValueIfaceT*, Void*, LibC::Int, AvroValueT*, LibC::Char** -> LibC::Int)
    get_by_name : (AvroValueIfaceT*, Void*, LibC::Char*, AvroValueT*, LibC::Int* -> LibC::Int)
    get_discriminant : (AvroValueIfaceT*, Void*, LibC::Int* -> LibC::Int)
    get_current_branch : (AvroValueIfaceT*, Void*, AvroValueT* -> LibC::Int)
    append : (AvroValueIfaceT*, Void*, AvroValueT*, LibC::Int* -> LibC::Int)
    add : (AvroValueIfaceT*, Void*, LibC::Char*, AvroValueT*, LibC::Int*, LibC::Int* -> LibC::Int)
    set_branch : (AvroValueIfaceT*, Void*, LibC::Int, AvroValueT* -> LibC::Int)
  end
  type AvroValueIfaceT = AvroValueIface
  struct AvroValue
    iface : AvroValueIfaceT*
    self : Void*
  end
  type AvroValueT = AvroValue
  fun avro_value_incref(value : AvroValueT*)
  fun avro_value_decref(value : AvroValueT*)
  fun avro_value_copy_ref(dest : AvroValueT*, src : AvroValueT*)
  fun avro_value_move_ref(dest : AvroValueT*, src : AvroValueT*)
  fun avro_value_equal(val1 : AvroValueT*, val2 : AvroValueT*) : LibC::Int
  fun avro_value_equal_fast(val1 : AvroValueT*, val2 : AvroValueT*) : LibC::Int
  fun avro_value_cmp(val1 : AvroValueT*, val2 : AvroValueT*) : LibC::Int
  fun avro_value_cmp_fast(val1 : AvroValueT*, val2 : AvroValueT*) : LibC::Int
  fun avro_value_copy(dest : AvroValueT*, src : AvroValueT*) : LibC::Int
  fun avro_value_copy_fast(dest : AvroValueT*, src : AvroValueT*) : LibC::Int
  fun avro_value_hash(value : AvroValueT*) : Uint32T
  alias Uint32T = LibC::UInt
  fun avro_value_to_json(value : AvroValueT*, one_line : LibC::Int, json_str : LibC::Char**) : LibC::Int
  fun avro_alloc_free_func(ptr : Void*, sz : LibC::Int)
  fun avro_string(str : LibC::Char*) : AvroDatumT
  alias AvroDatumT = AvroObjT*
  fun avro_givestring(str : LibC::Char*, free : AvroFreeFuncT) : AvroDatumT
  alias AvroFreeFuncT = (Void*, LibC::Int -> Void)
  fun avro_bytes(buf : LibC::Char*, len : Int64T) : AvroDatumT
  fun avro_givebytes(buf : LibC::Char*, len : Int64T, free : AvroFreeFuncT) : AvroDatumT
  fun avro_int32(i : Int32T) : AvroDatumT
  fun avro_int64(l : Int64T) : AvroDatumT
  fun avro_float(f : LibC::Float) : AvroDatumT
  fun avro_double(d : LibC::Double) : AvroDatumT
  fun avro_boolean(i : Int8T) : AvroDatumT
  alias Int8T = LibC::Char
  fun avro_null : AvroDatumT
  fun avro_record(schema : AvroSchemaT) : AvroDatumT
  fun avro_enum(schema : AvroSchemaT, i : LibC::Int) : AvroDatumT
  fun avro_fixed(schema : AvroSchemaT, bytes : LibC::Char*, size : Int64T) : AvroDatumT
  fun avro_givefixed(schema : AvroSchemaT, bytes : LibC::Char*, size : Int64T, free : AvroFreeFuncT) : AvroDatumT
  fun avro_map(schema : AvroSchemaT) : AvroDatumT
  fun avro_array(schema : AvroSchemaT) : AvroDatumT
  fun avro_union(schema : AvroSchemaT, discriminant : Int64T, datum : AvroDatumT) : AvroDatumT
  fun avro_datum_get_schema(datum : AvroDatumT) : AvroSchemaT
  fun avro_datum_from_schema(schema : AvroSchemaT) : AvroDatumT
  fun avro_string_get(datum : AvroDatumT, p : LibC::Char**) : LibC::Int
  fun avro_bytes_get(datum : AvroDatumT, bytes : LibC::Char**, size : Int64T*) : LibC::Int
  fun avro_int32_get(datum : AvroDatumT, i : Int32T*) : LibC::Int
  fun avro_int64_get(datum : AvroDatumT, l : Int64T*) : LibC::Int
  fun avro_float_get(datum : AvroDatumT, f : LibC::Float*) : LibC::Int
  fun avro_double_get(datum : AvroDatumT, d : LibC::Double*) : LibC::Int
  fun avro_boolean_get(datum : AvroDatumT, i : Int8T*) : LibC::Int
  fun avro_enum_get(datum : AvroDatumT) : LibC::Int
  fun avro_enum_get_name(datum : AvroDatumT) : LibC::Char*
  fun avro_fixed_get(datum : AvroDatumT, bytes : LibC::Char**, size : Int64T*) : LibC::Int
  fun avro_record_get(record : AvroDatumT, field_name : LibC::Char*, value : AvroDatumT*) : LibC::Int
  fun avro_map_get(datum : AvroDatumT, key : LibC::Char*, value : AvroDatumT*) : LibC::Int
  fun avro_map_get_key(datum : AvroDatumT, index : LibC::Int, key : LibC::Char**) : LibC::Int
  fun avro_map_get_index(datum : AvroDatumT, key : LibC::Char*, index : LibC::Int*) : LibC::Int
  fun avro_map_size : LibC::Int
  fun avro_array_get(datum : AvroDatumT, index : Int64T, value : AvroDatumT*) : LibC::Int
  fun avro_array_size : LibC::Int
  fun avro_union_discriminant(datum : AvroDatumT) : Int64T
  fun avro_union_current_branch(datum : AvroDatumT) : AvroDatumT
  fun avro_string_set(datum : AvroDatumT, p : LibC::Char*) : LibC::Int
  fun avro_givestring_set(datum : AvroDatumT, p : LibC::Char*, free : AvroFreeFuncT) : LibC::Int
  fun avro_bytes_set(datum : AvroDatumT, bytes : LibC::Char*, size : Int64T) : LibC::Int
  fun avro_givebytes_set(datum : AvroDatumT, bytes : LibC::Char*, size : Int64T, free : AvroFreeFuncT) : LibC::Int
  fun avro_int32_set(datum : AvroDatumT, i : Int32T) : LibC::Int
  fun avro_int64_set(datum : AvroDatumT, l : Int64T) : LibC::Int
  fun avro_float_set(datum : AvroDatumT, f : LibC::Float) : LibC::Int
  fun avro_double_set(datum : AvroDatumT, d : LibC::Double) : LibC::Int
  fun avro_boolean_set(datum : AvroDatumT, i : Int8T) : LibC::Int
  fun avro_enum_set(datum : AvroDatumT, symbol_value : LibC::Int) : LibC::Int
  fun avro_enum_set_name(datum : AvroDatumT, symbol_name : LibC::Char*) : LibC::Int
  fun avro_fixed_set(datum : AvroDatumT, bytes : LibC::Char*, size : Int64T) : LibC::Int
  fun avro_givefixed_set(datum : AvroDatumT, bytes : LibC::Char*, size : Int64T, free : AvroFreeFuncT) : LibC::Int
  fun avro_record_set(record : AvroDatumT, field_name : LibC::Char*, value : AvroDatumT) : LibC::Int
  fun avro_map_set(map : AvroDatumT, key : LibC::Char*, value : AvroDatumT) : LibC::Int
  fun avro_array_append_datum(array_datum : AvroDatumT, datum : AvroDatumT) : LibC::Int
  fun avro_union_set_discriminant(unionp : AvroDatumT, discriminant : LibC::Int, branch : AvroDatumT*) : LibC::Int
  fun avro_datum_reset(value : AvroDatumT) : LibC::Int
  fun avro_datum_incref(value : AvroDatumT) : AvroDatumT
  fun avro_datum_decref(value : AvroDatumT)
  fun avro_datum_print(value : AvroDatumT, fp : File*)
  struct X_IoFile
    _flags : LibC::Int
    _io_read_ptr : LibC::Char*
    _io_read_end : LibC::Char*
    _io_read_base : LibC::Char*
    _io_write_base : LibC::Char*
    _io_write_ptr : LibC::Char*
    _io_write_end : LibC::Char*
    _io_buf_base : LibC::Char*
    _io_buf_end : LibC::Char*
    _io_save_base : LibC::Char*
    _io_backup_base : LibC::Char*
    _io_save_end : LibC::Char*
    _markers : X_IoMarker*
    _chain : X_IoFile*
    _fileno : LibC::Int
    _flags2 : LibC::Int
    _old_offset : X__OffT
    _cur_column : LibC::UShort
    _vtable_offset : LibC::Char
    _shortbuf : LibC::Char[1]
    _lock : X_IoLockT*
    _offset : X__Off64T
    __pad1 : Void*
    __pad2 : Void*
    __pad3 : Void*
    __pad4 : Void*
    __pad5 : LibC::Int
    _mode : LibC::Int
    _unused2 : LibC::Char
  end
  type File = X_IoFile
  struct X_IoMarker
    _next : X_IoMarker*
    _sbuf : X_IoFile*
    _pos : LibC::Int
  end
  alias X__OffT = LibC::Long
  alias X_IoLockT = Void
  alias X__Off64T = LibC::Long
  fun avro_datum_equal(a : AvroDatumT, b : AvroDatumT) : LibC::Int
  fun avro_datum_to_json(datum : AvroDatumT, one_line : LibC::Int, json_str : LibC::Char**) : LibC::Int
  fun avro_schema_datum_validate(expected_schema : AvroSchemaT, datum : AvroDatumT) : LibC::Int
  fun avro_datum_class : AvroValueIfaceT*
  fun avro_datum_as_value(value : AvroValueT*, src : AvroDatumT) : LibC::Int
  fun avro_reader_file(fp : File*) : AvroReaderT
  type AvroReaderT = Void*
  fun avro_reader_file_fp(fp : File*, should_close : LibC::Int) : AvroReaderT
  fun avro_writer_file(fp : File*) : AvroWriterT
  type AvroWriterT = Void*
  fun avro_writer_file_fp(fp : File*, should_close : LibC::Int) : AvroWriterT
  fun avro_reader_memory(buf : LibC::Char*, len : Int64T) : AvroReaderT
  fun avro_writer_memory(buf : LibC::Char*, len : Int64T) : AvroWriterT
  fun avro_reader_memory_set_source(reader : AvroReaderT, buf : LibC::Char*, len : Int64T)
  fun avro_writer_memory_set_dest(writer : AvroWriterT, buf : LibC::Char*, len : Int64T)
  fun avro_read(reader : AvroReaderT, buf : Void*, len : Int64T) : LibC::Int
  fun avro_skip(reader : AvroReaderT, len : Int64T) : LibC::Int
  fun avro_write(writer : AvroWriterT, buf : Void*, len : Int64T) : LibC::Int
  fun avro_reader_reset(reader : AvroReaderT)
  fun avro_writer_reset(writer : AvroWriterT)
  fun avro_writer_tell(writer : AvroWriterT) : Int64T
  fun avro_writer_flush(writer : AvroWriterT)
  fun avro_writer_dump(writer : AvroWriterT, fp : File*)
  fun avro_reader_dump(reader : AvroReaderT, fp : File*)
  fun avro_reader_is_eof(reader : AvroReaderT) : LibC::Int
  fun avro_reader_free(reader : AvroReaderT)
  fun avro_writer_free(writer : AvroWriterT)
  fun avro_schema_to_json(schema : AvroSchemaT, out : AvroWriterT) : LibC::Int
  fun avro_value_read(reader : AvroReaderT, dest : AvroValueT*) : LibC::Int
  fun avro_value_write(writer : AvroWriterT, src : AvroValueT*) : LibC::Int
  fun avro_value_sizeof(src : AvroValueT*, size : LibC::Int*) : LibC::Int
  fun avro_file_writer_create(path : LibC::Char*, schema : AvroSchemaT, writer : AvroFileWriterT*) : LibC::Int
  type AvroFileWriterT = Void*
  fun avro_file_writer_create_fp(fp : File*, path : LibC::Char*, should_close : LibC::Int, schema : AvroSchemaT, writer : AvroFileWriterT*) : LibC::Int
  fun avro_file_writer_create_with_codec(path : LibC::Char*, schema : AvroSchemaT, writer : AvroFileWriterT*, codec : LibC::Char*, block_size : LibC::Int) : LibC::Int
  fun avro_file_writer_create_with_codec_fp(fp : File*, path : LibC::Char*, should_close : LibC::Int, schema : AvroSchemaT, writer : AvroFileWriterT*, codec : LibC::Char*, block_size : LibC::Int) : LibC::Int
  fun avro_file_writer_open(path : LibC::Char*, writer : AvroFileWriterT*) : LibC::Int
  fun avro_file_writer_open_bs(path : LibC::Char*, writer : AvroFileWriterT*, block_size : LibC::Int) : LibC::Int
  fun avro_file_reader(path : LibC::Char*, reader : AvroFileReaderT*) : LibC::Int
  type AvroFileReaderT = Void*
  fun avro_file_reader_fp(fp : File*, path : LibC::Char*, should_close : LibC::Int, reader : AvroFileReaderT*) : LibC::Int
  fun avro_file_reader_get_writer_schema(reader : AvroFileReaderT) : AvroSchemaT
  fun avro_file_writer_sync(writer : AvroFileWriterT) : LibC::Int
  fun avro_file_writer_flush(writer : AvroFileWriterT) : LibC::Int
  fun avro_file_writer_close(writer : AvroFileWriterT) : LibC::Int
  fun avro_file_reader_close(reader : AvroFileReaderT) : LibC::Int
  fun avro_file_reader_read_value(reader : AvroFileReaderT, dest : AvroValueT*) : LibC::Int
  fun avro_file_writer_append_value(writer : AvroFileWriterT, src : AvroValueT*) : LibC::Int
  fun avro_file_writer_append_encoded(writer : AvroFileWriterT, buf : Void*, len : Int64T) : LibC::Int
  fun avro_read_data(reader : AvroReaderT, writer_schema : AvroSchemaT, reader_schema : AvroSchemaT, datum : AvroDatumT*) : LibC::Int
  fun avro_skip_data(reader : AvroReaderT, writer_schema : AvroSchemaT) : LibC::Int
  fun avro_write_data(writer : AvroWriterT, writer_schema : AvroSchemaT, datum : AvroDatumT) : LibC::Int
  fun avro_size_data(writer : AvroWriterT, writer_schema : AvroSchemaT, datum : AvroDatumT) : Int64T
  fun avro_file_writer_append(writer : AvroFileWriterT, datum : AvroDatumT) : LibC::Int
  fun avro_file_reader_read(reader : AvroFileReaderT, readers_schema : AvroSchemaT, datum : AvroDatumT*) : LibC::Int
  struct AvroConsumerT
    schema : AvroSchemaT
    free : (AvroConsumerT* -> Void)
    boolean_value : (AvroConsumerT*, LibC::Int, Void* -> LibC::Int)
    bytes_value : (AvroConsumerT*, Void*, LibC::Int, Void* -> LibC::Int)
    double_value : (AvroConsumerT*, LibC::Double, Void* -> LibC::Int)
    float_value : (AvroConsumerT*, LibC::Float, Void* -> LibC::Int)
    int_value : (AvroConsumerT*, Int32T, Void* -> LibC::Int)
    long_value : (AvroConsumerT*, Int64T, Void* -> LibC::Int)
    null_value : (AvroConsumerT*, Void* -> LibC::Int)
    string_value : (AvroConsumerT*, Void*, LibC::Int, Void* -> LibC::Int)
    array_start_block : (AvroConsumerT*, LibC::Int, LibC::UInt, Void* -> LibC::Int)
    array_element : (AvroConsumerT*, LibC::UInt, AvroConsumerT**, Void**, Void* -> LibC::Int)
    enum_value : (AvroConsumerT*, LibC::Int, Void* -> LibC::Int)
    fixed_value : (AvroConsumerT*, Void*, LibC::Int, Void* -> LibC::Int)
    map_start_block : (AvroConsumerT*, LibC::Int, LibC::UInt, Void* -> LibC::Int)
    map_element : (AvroConsumerT*, LibC::UInt, LibC::Char*, AvroConsumerT**, Void**, Void* -> LibC::Int)
    record_start : (AvroConsumerT*, Void* -> LibC::Int)
    record_field : (AvroConsumerT*, LibC::UInt, AvroConsumerT**, Void**, Void* -> LibC::Int)
    union_branch : (AvroConsumerT*, LibC::UInt, AvroConsumerT**, Void**, Void* -> LibC::Int)
  end
  fun avro_consumer_free(consumer : AvroConsumerT*)
  fun avro_resolver_new(writer_schema : AvroSchemaT, reader_schema : AvroSchemaT) : AvroConsumerT*
  fun avro_consume_binary(reader : AvroReaderT, consumer : AvroConsumerT*, ud : Void*) : LibC::Int
  fun avro_strerror : LibC::Char*
  fun avro_set_error(fmt : LibC::Char*, ...)
  fun avro_prefix_error(fmt : LibC::Char*, ...)
  fun avro_generic_class_from_schema(schema : AvroSchemaT) : AvroValueIfaceT*
  fun avro_generic_value_new(iface : AvroValueIfaceT*, dest : AvroValueT*) : LibC::Int
  fun avro_generic_boolean_class : AvroValueIfaceT*
  fun avro_generic_bytes_class : AvroValueIfaceT*
  fun avro_generic_double_class : AvroValueIfaceT*
  fun avro_generic_float_class : AvroValueIfaceT*
  fun avro_generic_int_class : AvroValueIfaceT*
  fun avro_generic_long_class : AvroValueIfaceT*
  fun avro_generic_null_class : AvroValueIfaceT*
  fun avro_generic_string_class : AvroValueIfaceT*
  fun avro_generic_boolean_new(value : AvroValueT*, val : LibC::Int) : LibC::Int
  fun avro_generic_bytes_new(value : AvroValueT*, buf : Void*, size : LibC::Int) : LibC::Int
  fun avro_generic_double_new(value : AvroValueT*, val : LibC::Double) : LibC::Int
  fun avro_generic_float_new(value : AvroValueT*, val : LibC::Float) : LibC::Int
  fun avro_generic_int_new(value : AvroValueT*, val : Int32T) : LibC::Int
  fun avro_generic_long_new(value : AvroValueT*, val : Int64T) : LibC::Int
  fun avro_generic_null_new(value : AvroValueT*) : LibC::Int
  fun avro_generic_string_new(value : AvroValueT*, val : LibC::Char*) : LibC::Int
  fun avro_generic_string_new_length(value : AvroValueT*, val : LibC::Char*, size : LibC::Int) : LibC::Int
  fun avro_resolved_writer_new(writer_schema : AvroSchemaT, reader_schema : AvroSchemaT) : AvroValueIfaceT*
  fun avro_resolved_writer_new_value(iface : AvroValueIfaceT*, value : AvroValueT*) : LibC::Int
  fun avro_resolved_writer_set_dest(resolved : AvroValueT*, dest : AvroValueT*)
  fun avro_resolved_writer_clear_dest(resolved : AvroValueT*)
  fun avro_resolved_reader_new(writer_schema : AvroSchemaT, reader_schema : AvroSchemaT) : AvroValueIfaceT*
  fun avro_resolved_reader_new_value(iface : AvroValueIfaceT*, value : AvroValueT*) : LibC::Int
  fun avro_resolved_reader_set_source(resolved : AvroValueT*, dest : AvroValueT*)
  fun avro_resolved_reader_clear_source(resolved : AvroValueT*)
end

