module LibFlint3

using Flint3_jll
export Flint3_jll

using CEnum

const __time64_t = Clonglong

const time_t = __time64_t

function clang_getBuildSessionTimestamp()
    ccall((:clang_getBuildSessionTimestamp, libflint3), Culonglong, ())
end

mutable struct CXVirtualFileOverlayImpl end

const CXVirtualFileOverlay = Ptr{CXVirtualFileOverlayImpl}

function clang_VirtualFileOverlay_create(options)
    ccall((:clang_VirtualFileOverlay_create, libflint3), CXVirtualFileOverlay, (Cuint,), options)
end

@cenum CXErrorCode::UInt32 begin
    CXError_Success = 0
    CXError_Failure = 1
    CXError_Crashed = 2
    CXError_InvalidArguments = 3
    CXError_ASTReadError = 4
end

function clang_VirtualFileOverlay_addFileMapping(arg1, virtualPath, realPath)
    ccall((:clang_VirtualFileOverlay_addFileMapping, libflint3), CXErrorCode, (CXVirtualFileOverlay, Ptr{Cchar}, Ptr{Cchar}), arg1, virtualPath, realPath)
end

function clang_VirtualFileOverlay_setCaseSensitivity(arg1, caseSensitive)
    ccall((:clang_VirtualFileOverlay_setCaseSensitivity, libflint3), CXErrorCode, (CXVirtualFileOverlay, Cint), arg1, caseSensitive)
end

function clang_VirtualFileOverlay_writeToBuffer(arg1, options, out_buffer_ptr, out_buffer_size)
    ccall((:clang_VirtualFileOverlay_writeToBuffer, libflint3), CXErrorCode, (CXVirtualFileOverlay, Cuint, Ptr{Ptr{Cchar}}, Ptr{Cuint}), arg1, options, out_buffer_ptr, out_buffer_size)
end

function clang_free(buffer)
    ccall((:clang_free, libflint3), Cvoid, (Ptr{Cvoid},), buffer)
end

function clang_VirtualFileOverlay_dispose(arg1)
    ccall((:clang_VirtualFileOverlay_dispose, libflint3), Cvoid, (CXVirtualFileOverlay,), arg1)
end

mutable struct CXModuleMapDescriptorImpl end

const CXModuleMapDescriptor = Ptr{CXModuleMapDescriptorImpl}

function clang_ModuleMapDescriptor_create(options)
    ccall((:clang_ModuleMapDescriptor_create, libflint3), CXModuleMapDescriptor, (Cuint,), options)
end

function clang_ModuleMapDescriptor_setFrameworkModuleName(arg1, name)
    ccall((:clang_ModuleMapDescriptor_setFrameworkModuleName, libflint3), CXErrorCode, (CXModuleMapDescriptor, Ptr{Cchar}), arg1, name)
end

function clang_ModuleMapDescriptor_setUmbrellaHeader(arg1, name)
    ccall((:clang_ModuleMapDescriptor_setUmbrellaHeader, libflint3), CXErrorCode, (CXModuleMapDescriptor, Ptr{Cchar}), arg1, name)
end

function clang_ModuleMapDescriptor_writeToBuffer(arg1, options, out_buffer_ptr, out_buffer_size)
    ccall((:clang_ModuleMapDescriptor_writeToBuffer, libflint3), CXErrorCode, (CXModuleMapDescriptor, Cuint, Ptr{Ptr{Cchar}}, Ptr{Cuint}), arg1, options, out_buffer_ptr, out_buffer_size)
end

function clang_ModuleMapDescriptor_dispose(arg1)
    ccall((:clang_ModuleMapDescriptor_dispose, libflint3), Cvoid, (CXModuleMapDescriptor,), arg1)
end

const CXCompilationDatabase = Ptr{Cvoid}

const CXCompileCommands = Ptr{Cvoid}

const CXCompileCommand = Ptr{Cvoid}

@cenum CXCompilationDatabase_Error::UInt32 begin
    CXCompilationDatabase_NoError = 0
    CXCompilationDatabase_CanNotLoadDatabase = 1
end

function clang_CompilationDatabase_fromDirectory(BuildDir, ErrorCode)
    ccall((:clang_CompilationDatabase_fromDirectory, libflint3), CXCompilationDatabase, (Ptr{Cchar}, Ptr{CXCompilationDatabase_Error}), BuildDir, ErrorCode)
end

function clang_CompilationDatabase_dispose(arg1)
    ccall((:clang_CompilationDatabase_dispose, libflint3), Cvoid, (CXCompilationDatabase,), arg1)
end

function clang_CompilationDatabase_getCompileCommands(arg1, CompleteFileName)
    ccall((:clang_CompilationDatabase_getCompileCommands, libflint3), CXCompileCommands, (CXCompilationDatabase, Ptr{Cchar}), arg1, CompleteFileName)
end

function clang_CompilationDatabase_getAllCompileCommands(arg1)
    ccall((:clang_CompilationDatabase_getAllCompileCommands, libflint3), CXCompileCommands, (CXCompilationDatabase,), arg1)
end

function clang_CompileCommands_dispose(arg1)
    ccall((:clang_CompileCommands_dispose, libflint3), Cvoid, (CXCompileCommands,), arg1)
end

function clang_CompileCommands_getSize(arg1)
    ccall((:clang_CompileCommands_getSize, libflint3), Cuint, (CXCompileCommands,), arg1)
end

function clang_CompileCommands_getCommand(arg1, I)
    ccall((:clang_CompileCommands_getCommand, libflint3), CXCompileCommand, (CXCompileCommands, Cuint), arg1, I)
end

struct CXString
    data::Ptr{Cvoid}
    private_flags::Cuint
end

function clang_CompileCommand_getDirectory(arg1)
    ccall((:clang_CompileCommand_getDirectory, libflint3), CXString, (CXCompileCommand,), arg1)
end

function clang_CompileCommand_getFilename(arg1)
    ccall((:clang_CompileCommand_getFilename, libflint3), CXString, (CXCompileCommand,), arg1)
end

function clang_CompileCommand_getNumArgs(arg1)
    ccall((:clang_CompileCommand_getNumArgs, libflint3), Cuint, (CXCompileCommand,), arg1)
end

function clang_CompileCommand_getArg(arg1, I)
    ccall((:clang_CompileCommand_getArg, libflint3), CXString, (CXCompileCommand, Cuint), arg1, I)
end

function clang_CompileCommand_getNumMappedSources(arg1)
    ccall((:clang_CompileCommand_getNumMappedSources, libflint3), Cuint, (CXCompileCommand,), arg1)
end

function clang_CompileCommand_getMappedSourcePath(arg1, I)
    ccall((:clang_CompileCommand_getMappedSourcePath, libflint3), CXString, (CXCompileCommand, Cuint), arg1, I)
end

function clang_CompileCommand_getMappedSourceContent(arg1, I)
    ccall((:clang_CompileCommand_getMappedSourceContent, libflint3), CXString, (CXCompileCommand, Cuint), arg1, I)
end

@cenum CXDiagnosticSeverity::UInt32 begin
    CXDiagnostic_Ignored = 0
    CXDiagnostic_Note = 1
    CXDiagnostic_Warning = 2
    CXDiagnostic_Error = 3
    CXDiagnostic_Fatal = 4
end

const CXDiagnostic = Ptr{Cvoid}

const CXDiagnosticSet = Ptr{Cvoid}

function clang_getNumDiagnosticsInSet(Diags)
    ccall((:clang_getNumDiagnosticsInSet, libflint3), Cuint, (CXDiagnosticSet,), Diags)
end

function clang_getDiagnosticInSet(Diags, Index)
    ccall((:clang_getDiagnosticInSet, libflint3), CXDiagnostic, (CXDiagnosticSet, Cuint), Diags, Index)
end

@cenum CXLoadDiag_Error::UInt32 begin
    CXLoadDiag_None = 0
    CXLoadDiag_Unknown = 1
    CXLoadDiag_CannotLoad = 2
    CXLoadDiag_InvalidFile = 3
end

function clang_loadDiagnostics(file, error, errorString)
    ccall((:clang_loadDiagnostics, libflint3), CXDiagnosticSet, (Ptr{Cchar}, Ptr{CXLoadDiag_Error}, Ptr{CXString}), file, error, errorString)
end

function clang_disposeDiagnosticSet(Diags)
    ccall((:clang_disposeDiagnosticSet, libflint3), Cvoid, (CXDiagnosticSet,), Diags)
end

function clang_getChildDiagnostics(D)
    ccall((:clang_getChildDiagnostics, libflint3), CXDiagnosticSet, (CXDiagnostic,), D)
end

function clang_disposeDiagnostic(Diagnostic)
    ccall((:clang_disposeDiagnostic, libflint3), Cvoid, (CXDiagnostic,), Diagnostic)
end

@cenum CXDiagnosticDisplayOptions::UInt32 begin
    CXDiagnostic_DisplaySourceLocation = 1
    CXDiagnostic_DisplayColumn = 2
    CXDiagnostic_DisplaySourceRanges = 4
    CXDiagnostic_DisplayOption = 8
    CXDiagnostic_DisplayCategoryId = 16
    CXDiagnostic_DisplayCategoryName = 32
end

function clang_formatDiagnostic(Diagnostic, Options)
    ccall((:clang_formatDiagnostic, libflint3), CXString, (CXDiagnostic, Cuint), Diagnostic, Options)
end

function clang_defaultDiagnosticDisplayOptions()
    ccall((:clang_defaultDiagnosticDisplayOptions, libflint3), Cuint, ())
end

function clang_getDiagnosticSeverity(arg1)
    ccall((:clang_getDiagnosticSeverity, libflint3), CXDiagnosticSeverity, (CXDiagnostic,), arg1)
end

struct CXSourceLocation
    ptr_data::NTuple{2, Ptr{Cvoid}}
    int_data::Cuint
end

function clang_getDiagnosticLocation(arg1)
    ccall((:clang_getDiagnosticLocation, libflint3), CXSourceLocation, (CXDiagnostic,), arg1)
end

function clang_getDiagnosticSpelling(arg1)
    ccall((:clang_getDiagnosticSpelling, libflint3), CXString, (CXDiagnostic,), arg1)
end

function clang_getDiagnosticOption(Diag, Disable)
    ccall((:clang_getDiagnosticOption, libflint3), CXString, (CXDiagnostic, Ptr{CXString}), Diag, Disable)
end

function clang_getDiagnosticCategory(arg1)
    ccall((:clang_getDiagnosticCategory, libflint3), Cuint, (CXDiagnostic,), arg1)
end

function clang_getDiagnosticCategoryName(Category)
    ccall((:clang_getDiagnosticCategoryName, libflint3), CXString, (Cuint,), Category)
end

function clang_getDiagnosticCategoryText(arg1)
    ccall((:clang_getDiagnosticCategoryText, libflint3), CXString, (CXDiagnostic,), arg1)
end

function clang_getDiagnosticNumRanges(arg1)
    ccall((:clang_getDiagnosticNumRanges, libflint3), Cuint, (CXDiagnostic,), arg1)
end

struct CXSourceRange
    ptr_data::NTuple{2, Ptr{Cvoid}}
    begin_int_data::Cuint
    end_int_data::Cuint
end

function clang_getDiagnosticRange(Diagnostic, Range)
    ccall((:clang_getDiagnosticRange, libflint3), CXSourceRange, (CXDiagnostic, Cuint), Diagnostic, Range)
end

function clang_getDiagnosticNumFixIts(Diagnostic)
    ccall((:clang_getDiagnosticNumFixIts, libflint3), Cuint, (CXDiagnostic,), Diagnostic)
end

function clang_getDiagnosticFixIt(Diagnostic, FixIt, ReplacementRange)
    ccall((:clang_getDiagnosticFixIt, libflint3), CXString, (CXDiagnostic, Cuint, Ptr{CXSourceRange}), Diagnostic, FixIt, ReplacementRange)
end

const CXFile = Ptr{Cvoid}

function clang_getFileName(SFile)
    ccall((:clang_getFileName, libflint3), CXString, (CXFile,), SFile)
end

function clang_getFileTime(SFile)
    ccall((:clang_getFileTime, libflint3), time_t, (CXFile,), SFile)
end

struct CXFileUniqueID
    data::NTuple{3, Culonglong}
end

function clang_getFileUniqueID(file, outID)
    ccall((:clang_getFileUniqueID, libflint3), Cint, (CXFile, Ptr{CXFileUniqueID}), file, outID)
end

function clang_File_isEqual(file1, file2)
    ccall((:clang_File_isEqual, libflint3), Cint, (CXFile, CXFile), file1, file2)
end

function clang_File_tryGetRealPathName(file)
    ccall((:clang_File_tryGetRealPathName, libflint3), CXString, (CXFile,), file)
end

function clang_getNullLocation()
    ccall((:clang_getNullLocation, libflint3), CXSourceLocation, ())
end

function clang_equalLocations(loc1, loc2)
    ccall((:clang_equalLocations, libflint3), Cuint, (CXSourceLocation, CXSourceLocation), loc1, loc2)
end

function clang_Location_isInSystemHeader(location)
    ccall((:clang_Location_isInSystemHeader, libflint3), Cint, (CXSourceLocation,), location)
end

function clang_Location_isFromMainFile(location)
    ccall((:clang_Location_isFromMainFile, libflint3), Cint, (CXSourceLocation,), location)
end

function clang_getNullRange()
    ccall((:clang_getNullRange, libflint3), CXSourceRange, ())
end

function clang_getRange(_begin, _end)
    ccall((:clang_getRange, libflint3), CXSourceRange, (CXSourceLocation, CXSourceLocation), _begin, _end)
end

function clang_equalRanges(range1, range2)
    ccall((:clang_equalRanges, libflint3), Cuint, (CXSourceRange, CXSourceRange), range1, range2)
end

function clang_Range_isNull(range)
    ccall((:clang_Range_isNull, libflint3), Cint, (CXSourceRange,), range)
end

function clang_getExpansionLocation(location, file, line, column, offset)
    ccall((:clang_getExpansionLocation, libflint3), Cvoid, (CXSourceLocation, Ptr{CXFile}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), location, file, line, column, offset)
end

function clang_getPresumedLocation(location, filename, line, column)
    ccall((:clang_getPresumedLocation, libflint3), Cvoid, (CXSourceLocation, Ptr{CXString}, Ptr{Cuint}, Ptr{Cuint}), location, filename, line, column)
end

function clang_getInstantiationLocation(location, file, line, column, offset)
    ccall((:clang_getInstantiationLocation, libflint3), Cvoid, (CXSourceLocation, Ptr{CXFile}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), location, file, line, column, offset)
end

function clang_getSpellingLocation(location, file, line, column, offset)
    ccall((:clang_getSpellingLocation, libflint3), Cvoid, (CXSourceLocation, Ptr{CXFile}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), location, file, line, column, offset)
end

function clang_getFileLocation(location, file, line, column, offset)
    ccall((:clang_getFileLocation, libflint3), Cvoid, (CXSourceLocation, Ptr{CXFile}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), location, file, line, column, offset)
end

function clang_getRangeStart(range)
    ccall((:clang_getRangeStart, libflint3), CXSourceLocation, (CXSourceRange,), range)
end

function clang_getRangeEnd(range)
    ccall((:clang_getRangeEnd, libflint3), CXSourceLocation, (CXSourceRange,), range)
end

struct CXSourceRangeList
    count::Cuint
    ranges::Ptr{CXSourceRange}
end

function clang_disposeSourceRangeList(ranges)
    ccall((:clang_disposeSourceRangeList, libflint3), Cvoid, (Ptr{CXSourceRangeList},), ranges)
end

struct CXStringSet
    Strings::Ptr{CXString}
    Count::Cuint
end

function clang_getCString(string)
    ccall((:clang_getCString, libflint3), Ptr{Cchar}, (CXString,), string)
end

function clang_disposeString(string)
    ccall((:clang_disposeString, libflint3), Cvoid, (CXString,), string)
end

function clang_disposeStringSet(set)
    ccall((:clang_disposeStringSet, libflint3), Cvoid, (Ptr{CXStringSet},), set)
end

mutable struct CXTranslationUnitImpl end

const CXTranslationUnit = Ptr{CXTranslationUnitImpl}

struct CXComment
    ASTNode::Ptr{Cvoid}
    TranslationUnit::CXTranslationUnit
end

@cenum CXCursorKind::UInt32 begin
    CXCursor_UnexposedDecl = 1
    CXCursor_StructDecl = 2
    CXCursor_UnionDecl = 3
    CXCursor_ClassDecl = 4
    CXCursor_EnumDecl = 5
    CXCursor_FieldDecl = 6
    CXCursor_EnumConstantDecl = 7
    CXCursor_FunctionDecl = 8
    CXCursor_VarDecl = 9
    CXCursor_ParmDecl = 10
    CXCursor_ObjCInterfaceDecl = 11
    CXCursor_ObjCCategoryDecl = 12
    CXCursor_ObjCProtocolDecl = 13
    CXCursor_ObjCPropertyDecl = 14
    CXCursor_ObjCIvarDecl = 15
    CXCursor_ObjCInstanceMethodDecl = 16
    CXCursor_ObjCClassMethodDecl = 17
    CXCursor_ObjCImplementationDecl = 18
    CXCursor_ObjCCategoryImplDecl = 19
    CXCursor_TypedefDecl = 20
    CXCursor_CXXMethod = 21
    CXCursor_Namespace = 22
    CXCursor_LinkageSpec = 23
    CXCursor_Constructor = 24
    CXCursor_Destructor = 25
    CXCursor_ConversionFunction = 26
    CXCursor_TemplateTypeParameter = 27
    CXCursor_NonTypeTemplateParameter = 28
    CXCursor_TemplateTemplateParameter = 29
    CXCursor_FunctionTemplate = 30
    CXCursor_ClassTemplate = 31
    CXCursor_ClassTemplatePartialSpecialization = 32
    CXCursor_NamespaceAlias = 33
    CXCursor_UsingDirective = 34
    CXCursor_UsingDeclaration = 35
    CXCursor_TypeAliasDecl = 36
    CXCursor_ObjCSynthesizeDecl = 37
    CXCursor_ObjCDynamicDecl = 38
    CXCursor_CXXAccessSpecifier = 39
    CXCursor_FirstDecl = 1
    CXCursor_LastDecl = 39
    CXCursor_FirstRef = 40
    CXCursor_ObjCSuperClassRef = 40
    CXCursor_ObjCProtocolRef = 41
    CXCursor_ObjCClassRef = 42
    CXCursor_TypeRef = 43
    CXCursor_CXXBaseSpecifier = 44
    CXCursor_TemplateRef = 45
    CXCursor_NamespaceRef = 46
    CXCursor_MemberRef = 47
    CXCursor_LabelRef = 48
    CXCursor_OverloadedDeclRef = 49
    CXCursor_VariableRef = 50
    CXCursor_LastRef = 50
    CXCursor_FirstInvalid = 70
    CXCursor_InvalidFile = 70
    CXCursor_NoDeclFound = 71
    CXCursor_NotImplemented = 72
    CXCursor_InvalidCode = 73
    CXCursor_LastInvalid = 73
    CXCursor_FirstExpr = 100
    CXCursor_UnexposedExpr = 100
    CXCursor_DeclRefExpr = 101
    CXCursor_MemberRefExpr = 102
    CXCursor_CallExpr = 103
    CXCursor_ObjCMessageExpr = 104
    CXCursor_BlockExpr = 105
    CXCursor_IntegerLiteral = 106
    CXCursor_FloatingLiteral = 107
    CXCursor_ImaginaryLiteral = 108
    CXCursor_StringLiteral = 109
    CXCursor_CharacterLiteral = 110
    CXCursor_ParenExpr = 111
    CXCursor_UnaryOperator = 112
    CXCursor_ArraySubscriptExpr = 113
    CXCursor_BinaryOperator = 114
    CXCursor_CompoundAssignOperator = 115
    CXCursor_ConditionalOperator = 116
    CXCursor_CStyleCastExpr = 117
    CXCursor_CompoundLiteralExpr = 118
    CXCursor_InitListExpr = 119
    CXCursor_AddrLabelExpr = 120
    CXCursor_StmtExpr = 121
    CXCursor_GenericSelectionExpr = 122
    CXCursor_GNUNullExpr = 123
    CXCursor_CXXStaticCastExpr = 124
    CXCursor_CXXDynamicCastExpr = 125
    CXCursor_CXXReinterpretCastExpr = 126
    CXCursor_CXXConstCastExpr = 127
    CXCursor_CXXFunctionalCastExpr = 128
    CXCursor_CXXTypeidExpr = 129
    CXCursor_CXXBoolLiteralExpr = 130
    CXCursor_CXXNullPtrLiteralExpr = 131
    CXCursor_CXXThisExpr = 132
    CXCursor_CXXThrowExpr = 133
    CXCursor_CXXNewExpr = 134
    CXCursor_CXXDeleteExpr = 135
    CXCursor_UnaryExpr = 136
    CXCursor_ObjCStringLiteral = 137
    CXCursor_ObjCEncodeExpr = 138
    CXCursor_ObjCSelectorExpr = 139
    CXCursor_ObjCProtocolExpr = 140
    CXCursor_ObjCBridgedCastExpr = 141
    CXCursor_PackExpansionExpr = 142
    CXCursor_SizeOfPackExpr = 143
    CXCursor_LambdaExpr = 144
    CXCursor_ObjCBoolLiteralExpr = 145
    CXCursor_ObjCSelfExpr = 146
    CXCursor_OMPArraySectionExpr = 147
    CXCursor_ObjCAvailabilityCheckExpr = 148
    CXCursor_FixedPointLiteral = 149
    CXCursor_OMPArrayShapingExpr = 150
    CXCursor_OMPIteratorExpr = 151
    CXCursor_CXXAddrspaceCastExpr = 152
    CXCursor_ConceptSpecializationExpr = 153
    CXCursor_RequiresExpr = 154
    CXCursor_CXXParenListInitExpr = 155
    CXCursor_LastExpr = 155
    CXCursor_FirstStmt = 200
    CXCursor_UnexposedStmt = 200
    CXCursor_LabelStmt = 201
    CXCursor_CompoundStmt = 202
    CXCursor_CaseStmt = 203
    CXCursor_DefaultStmt = 204
    CXCursor_IfStmt = 205
    CXCursor_SwitchStmt = 206
    CXCursor_WhileStmt = 207
    CXCursor_DoStmt = 208
    CXCursor_ForStmt = 209
    CXCursor_GotoStmt = 210
    CXCursor_IndirectGotoStmt = 211
    CXCursor_ContinueStmt = 212
    CXCursor_BreakStmt = 213
    CXCursor_ReturnStmt = 214
    CXCursor_GCCAsmStmt = 215
    CXCursor_AsmStmt = 215
    CXCursor_ObjCAtTryStmt = 216
    CXCursor_ObjCAtCatchStmt = 217
    CXCursor_ObjCAtFinallyStmt = 218
    CXCursor_ObjCAtThrowStmt = 219
    CXCursor_ObjCAtSynchronizedStmt = 220
    CXCursor_ObjCAutoreleasePoolStmt = 221
    CXCursor_ObjCForCollectionStmt = 222
    CXCursor_CXXCatchStmt = 223
    CXCursor_CXXTryStmt = 224
    CXCursor_CXXForRangeStmt = 225
    CXCursor_SEHTryStmt = 226
    CXCursor_SEHExceptStmt = 227
    CXCursor_SEHFinallyStmt = 228
    CXCursor_MSAsmStmt = 229
    CXCursor_NullStmt = 230
    CXCursor_DeclStmt = 231
    CXCursor_OMPParallelDirective = 232
    CXCursor_OMPSimdDirective = 233
    CXCursor_OMPForDirective = 234
    CXCursor_OMPSectionsDirective = 235
    CXCursor_OMPSectionDirective = 236
    CXCursor_OMPSingleDirective = 237
    CXCursor_OMPParallelForDirective = 238
    CXCursor_OMPParallelSectionsDirective = 239
    CXCursor_OMPTaskDirective = 240
    CXCursor_OMPMasterDirective = 241
    CXCursor_OMPCriticalDirective = 242
    CXCursor_OMPTaskyieldDirective = 243
    CXCursor_OMPBarrierDirective = 244
    CXCursor_OMPTaskwaitDirective = 245
    CXCursor_OMPFlushDirective = 246
    CXCursor_SEHLeaveStmt = 247
    CXCursor_OMPOrderedDirective = 248
    CXCursor_OMPAtomicDirective = 249
    CXCursor_OMPForSimdDirective = 250
    CXCursor_OMPParallelForSimdDirective = 251
    CXCursor_OMPTargetDirective = 252
    CXCursor_OMPTeamsDirective = 253
    CXCursor_OMPTaskgroupDirective = 254
    CXCursor_OMPCancellationPointDirective = 255
    CXCursor_OMPCancelDirective = 256
    CXCursor_OMPTargetDataDirective = 257
    CXCursor_OMPTaskLoopDirective = 258
    CXCursor_OMPTaskLoopSimdDirective = 259
    CXCursor_OMPDistributeDirective = 260
    CXCursor_OMPTargetEnterDataDirective = 261
    CXCursor_OMPTargetExitDataDirective = 262
    CXCursor_OMPTargetParallelDirective = 263
    CXCursor_OMPTargetParallelForDirective = 264
    CXCursor_OMPTargetUpdateDirective = 265
    CXCursor_OMPDistributeParallelForDirective = 266
    CXCursor_OMPDistributeParallelForSimdDirective = 267
    CXCursor_OMPDistributeSimdDirective = 268
    CXCursor_OMPTargetParallelForSimdDirective = 269
    CXCursor_OMPTargetSimdDirective = 270
    CXCursor_OMPTeamsDistributeDirective = 271
    CXCursor_OMPTeamsDistributeSimdDirective = 272
    CXCursor_OMPTeamsDistributeParallelForSimdDirective = 273
    CXCursor_OMPTeamsDistributeParallelForDirective = 274
    CXCursor_OMPTargetTeamsDirective = 275
    CXCursor_OMPTargetTeamsDistributeDirective = 276
    CXCursor_OMPTargetTeamsDistributeParallelForDirective = 277
    CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective = 278
    CXCursor_OMPTargetTeamsDistributeSimdDirective = 279
    CXCursor_BuiltinBitCastExpr = 280
    CXCursor_OMPMasterTaskLoopDirective = 281
    CXCursor_OMPParallelMasterTaskLoopDirective = 282
    CXCursor_OMPMasterTaskLoopSimdDirective = 283
    CXCursor_OMPParallelMasterTaskLoopSimdDirective = 284
    CXCursor_OMPParallelMasterDirective = 285
    CXCursor_OMPDepobjDirective = 286
    CXCursor_OMPScanDirective = 287
    CXCursor_OMPTileDirective = 288
    CXCursor_OMPCanonicalLoop = 289
    CXCursor_OMPInteropDirective = 290
    CXCursor_OMPDispatchDirective = 291
    CXCursor_OMPMaskedDirective = 292
    CXCursor_OMPUnrollDirective = 293
    CXCursor_OMPMetaDirective = 294
    CXCursor_OMPGenericLoopDirective = 295
    CXCursor_OMPTeamsGenericLoopDirective = 296
    CXCursor_OMPTargetTeamsGenericLoopDirective = 297
    CXCursor_OMPParallelGenericLoopDirective = 298
    CXCursor_OMPTargetParallelGenericLoopDirective = 299
    CXCursor_OMPParallelMaskedDirective = 300
    CXCursor_OMPMaskedTaskLoopDirective = 301
    CXCursor_OMPMaskedTaskLoopSimdDirective = 302
    CXCursor_OMPParallelMaskedTaskLoopDirective = 303
    CXCursor_OMPParallelMaskedTaskLoopSimdDirective = 304
    CXCursor_OMPErrorDirective = 305
    CXCursor_LastStmt = 305
    CXCursor_TranslationUnit = 350
    CXCursor_FirstAttr = 400
    CXCursor_UnexposedAttr = 400
    CXCursor_IBActionAttr = 401
    CXCursor_IBOutletAttr = 402
    CXCursor_IBOutletCollectionAttr = 403
    CXCursor_CXXFinalAttr = 404
    CXCursor_CXXOverrideAttr = 405
    CXCursor_AnnotateAttr = 406
    CXCursor_AsmLabelAttr = 407
    CXCursor_PackedAttr = 408
    CXCursor_PureAttr = 409
    CXCursor_ConstAttr = 410
    CXCursor_NoDuplicateAttr = 411
    CXCursor_CUDAConstantAttr = 412
    CXCursor_CUDADeviceAttr = 413
    CXCursor_CUDAGlobalAttr = 414
    CXCursor_CUDAHostAttr = 415
    CXCursor_CUDASharedAttr = 416
    CXCursor_VisibilityAttr = 417
    CXCursor_DLLExport = 418
    CXCursor_DLLImport = 419
    CXCursor_NSReturnsRetained = 420
    CXCursor_NSReturnsNotRetained = 421
    CXCursor_NSReturnsAutoreleased = 422
    CXCursor_NSConsumesSelf = 423
    CXCursor_NSConsumed = 424
    CXCursor_ObjCException = 425
    CXCursor_ObjCNSObject = 426
    CXCursor_ObjCIndependentClass = 427
    CXCursor_ObjCPreciseLifetime = 428
    CXCursor_ObjCReturnsInnerPointer = 429
    CXCursor_ObjCRequiresSuper = 430
    CXCursor_ObjCRootClass = 431
    CXCursor_ObjCSubclassingRestricted = 432
    CXCursor_ObjCExplicitProtocolImpl = 433
    CXCursor_ObjCDesignatedInitializer = 434
    CXCursor_ObjCRuntimeVisible = 435
    CXCursor_ObjCBoxable = 436
    CXCursor_FlagEnum = 437
    CXCursor_ConvergentAttr = 438
    CXCursor_WarnUnusedAttr = 439
    CXCursor_WarnUnusedResultAttr = 440
    CXCursor_AlignedAttr = 441
    CXCursor_LastAttr = 441
    CXCursor_PreprocessingDirective = 500
    CXCursor_MacroDefinition = 501
    CXCursor_MacroExpansion = 502
    CXCursor_MacroInstantiation = 502
    CXCursor_InclusionDirective = 503
    CXCursor_FirstPreprocessing = 500
    CXCursor_LastPreprocessing = 503
    CXCursor_ModuleImportDecl = 600
    CXCursor_TypeAliasTemplateDecl = 601
    CXCursor_StaticAssert = 602
    CXCursor_FriendDecl = 603
    CXCursor_ConceptDecl = 604
    CXCursor_FirstExtraDecl = 600
    CXCursor_LastExtraDecl = 604
    CXCursor_OverloadCandidate = 700
end

struct CXCursor
    kind::CXCursorKind
    xdata::Cint
    data::NTuple{3, Ptr{Cvoid}}
end

function clang_Cursor_getParsedComment(C)
    ccall((:clang_Cursor_getParsedComment, libflint3), CXComment, (CXCursor,), C)
end

@cenum CXCommentKind::UInt32 begin
    CXComment_Null = 0
    CXComment_Text = 1
    CXComment_InlineCommand = 2
    CXComment_HTMLStartTag = 3
    CXComment_HTMLEndTag = 4
    CXComment_Paragraph = 5
    CXComment_BlockCommand = 6
    CXComment_ParamCommand = 7
    CXComment_TParamCommand = 8
    CXComment_VerbatimBlockCommand = 9
    CXComment_VerbatimBlockLine = 10
    CXComment_VerbatimLine = 11
    CXComment_FullComment = 12
end

@cenum CXCommentInlineCommandRenderKind::UInt32 begin
    CXCommentInlineCommandRenderKind_Normal = 0
    CXCommentInlineCommandRenderKind_Bold = 1
    CXCommentInlineCommandRenderKind_Monospaced = 2
    CXCommentInlineCommandRenderKind_Emphasized = 3
    CXCommentInlineCommandRenderKind_Anchor = 4
end

@cenum CXCommentParamPassDirection::UInt32 begin
    CXCommentParamPassDirection_In = 0
    CXCommentParamPassDirection_Out = 1
    CXCommentParamPassDirection_InOut = 2
end

function clang_Comment_getKind(Comment)
    ccall((:clang_Comment_getKind, libflint3), CXCommentKind, (CXComment,), Comment)
end

function clang_Comment_getNumChildren(Comment)
    ccall((:clang_Comment_getNumChildren, libflint3), Cuint, (CXComment,), Comment)
end

function clang_Comment_getChild(Comment, ChildIdx)
    ccall((:clang_Comment_getChild, libflint3), CXComment, (CXComment, Cuint), Comment, ChildIdx)
end

function clang_Comment_isWhitespace(Comment)
    ccall((:clang_Comment_isWhitespace, libflint3), Cuint, (CXComment,), Comment)
end

function clang_InlineContentComment_hasTrailingNewline(Comment)
    ccall((:clang_InlineContentComment_hasTrailingNewline, libflint3), Cuint, (CXComment,), Comment)
end

function clang_TextComment_getText(Comment)
    ccall((:clang_TextComment_getText, libflint3), CXString, (CXComment,), Comment)
end

function clang_InlineCommandComment_getCommandName(Comment)
    ccall((:clang_InlineCommandComment_getCommandName, libflint3), CXString, (CXComment,), Comment)
end

function clang_InlineCommandComment_getRenderKind(Comment)
    ccall((:clang_InlineCommandComment_getRenderKind, libflint3), CXCommentInlineCommandRenderKind, (CXComment,), Comment)
end

function clang_InlineCommandComment_getNumArgs(Comment)
    ccall((:clang_InlineCommandComment_getNumArgs, libflint3), Cuint, (CXComment,), Comment)
end

function clang_InlineCommandComment_getArgText(Comment, ArgIdx)
    ccall((:clang_InlineCommandComment_getArgText, libflint3), CXString, (CXComment, Cuint), Comment, ArgIdx)
end

function clang_HTMLTagComment_getTagName(Comment)
    ccall((:clang_HTMLTagComment_getTagName, libflint3), CXString, (CXComment,), Comment)
end

function clang_HTMLStartTagComment_isSelfClosing(Comment)
    ccall((:clang_HTMLStartTagComment_isSelfClosing, libflint3), Cuint, (CXComment,), Comment)
end

function clang_HTMLStartTag_getNumAttrs(Comment)
    ccall((:clang_HTMLStartTag_getNumAttrs, libflint3), Cuint, (CXComment,), Comment)
end

function clang_HTMLStartTag_getAttrName(Comment, AttrIdx)
    ccall((:clang_HTMLStartTag_getAttrName, libflint3), CXString, (CXComment, Cuint), Comment, AttrIdx)
end

function clang_HTMLStartTag_getAttrValue(Comment, AttrIdx)
    ccall((:clang_HTMLStartTag_getAttrValue, libflint3), CXString, (CXComment, Cuint), Comment, AttrIdx)
end

function clang_BlockCommandComment_getCommandName(Comment)
    ccall((:clang_BlockCommandComment_getCommandName, libflint3), CXString, (CXComment,), Comment)
end

function clang_BlockCommandComment_getNumArgs(Comment)
    ccall((:clang_BlockCommandComment_getNumArgs, libflint3), Cuint, (CXComment,), Comment)
end

function clang_BlockCommandComment_getArgText(Comment, ArgIdx)
    ccall((:clang_BlockCommandComment_getArgText, libflint3), CXString, (CXComment, Cuint), Comment, ArgIdx)
end

function clang_BlockCommandComment_getParagraph(Comment)
    ccall((:clang_BlockCommandComment_getParagraph, libflint3), CXComment, (CXComment,), Comment)
end

function clang_ParamCommandComment_getParamName(Comment)
    ccall((:clang_ParamCommandComment_getParamName, libflint3), CXString, (CXComment,), Comment)
end

function clang_ParamCommandComment_isParamIndexValid(Comment)
    ccall((:clang_ParamCommandComment_isParamIndexValid, libflint3), Cuint, (CXComment,), Comment)
end

function clang_ParamCommandComment_getParamIndex(Comment)
    ccall((:clang_ParamCommandComment_getParamIndex, libflint3), Cuint, (CXComment,), Comment)
end

function clang_ParamCommandComment_isDirectionExplicit(Comment)
    ccall((:clang_ParamCommandComment_isDirectionExplicit, libflint3), Cuint, (CXComment,), Comment)
end

function clang_ParamCommandComment_getDirection(Comment)
    ccall((:clang_ParamCommandComment_getDirection, libflint3), CXCommentParamPassDirection, (CXComment,), Comment)
end

function clang_TParamCommandComment_getParamName(Comment)
    ccall((:clang_TParamCommandComment_getParamName, libflint3), CXString, (CXComment,), Comment)
end

function clang_TParamCommandComment_isParamPositionValid(Comment)
    ccall((:clang_TParamCommandComment_isParamPositionValid, libflint3), Cuint, (CXComment,), Comment)
end

function clang_TParamCommandComment_getDepth(Comment)
    ccall((:clang_TParamCommandComment_getDepth, libflint3), Cuint, (CXComment,), Comment)
end

function clang_TParamCommandComment_getIndex(Comment, Depth)
    ccall((:clang_TParamCommandComment_getIndex, libflint3), Cuint, (CXComment, Cuint), Comment, Depth)
end

function clang_VerbatimBlockLineComment_getText(Comment)
    ccall((:clang_VerbatimBlockLineComment_getText, libflint3), CXString, (CXComment,), Comment)
end

function clang_VerbatimLineComment_getText(Comment)
    ccall((:clang_VerbatimLineComment_getText, libflint3), CXString, (CXComment,), Comment)
end

function clang_HTMLTagComment_getAsString(Comment)
    ccall((:clang_HTMLTagComment_getAsString, libflint3), CXString, (CXComment,), Comment)
end

function clang_FullComment_getAsHTML(Comment)
    ccall((:clang_FullComment_getAsHTML, libflint3), CXString, (CXComment,), Comment)
end

function clang_FullComment_getAsXML(Comment)
    ccall((:clang_FullComment_getAsXML, libflint3), CXString, (CXComment,), Comment)
end

mutable struct CXAPISetImpl end

const CXAPISet = Ptr{CXAPISetImpl}

function clang_createAPISet(tu, out_api)
    ccall((:clang_createAPISet, libflint3), CXErrorCode, (CXTranslationUnit, Ptr{CXAPISet}), tu, out_api)
end

function clang_disposeAPISet(api)
    ccall((:clang_disposeAPISet, libflint3), Cvoid, (CXAPISet,), api)
end

function clang_getSymbolGraphForUSR(usr, api)
    ccall((:clang_getSymbolGraphForUSR, libflint3), CXString, (Ptr{Cchar}, CXAPISet), usr, api)
end

function clang_getSymbolGraphForCursor(cursor)
    ccall((:clang_getSymbolGraphForCursor, libflint3), CXString, (CXCursor,), cursor)
end

function clang_install_aborting_llvm_fatal_error_handler()
    ccall((:clang_install_aborting_llvm_fatal_error_handler, libflint3), Cvoid, ())
end

function clang_uninstall_llvm_fatal_error_handler()
    ccall((:clang_uninstall_llvm_fatal_error_handler, libflint3), Cvoid, ())
end

const CXIndex = Ptr{Cvoid}

mutable struct CXTargetInfoImpl end

const CXTargetInfo = Ptr{CXTargetInfoImpl}

const CXClientData = Ptr{Cvoid}

struct CXUnsavedFile
    Filename::Ptr{Cchar}
    Contents::Ptr{Cchar}
    Length::Culong
end

@cenum CXAvailabilityKind::UInt32 begin
    CXAvailability_Available = 0
    CXAvailability_Deprecated = 1
    CXAvailability_NotAvailable = 2
    CXAvailability_NotAccessible = 3
end

struct CXVersion
    Major::Cint
    Minor::Cint
    Subminor::Cint
end

@cenum CXCursor_ExceptionSpecificationKind::UInt32 begin
    CXCursor_ExceptionSpecificationKind_None = 0
    CXCursor_ExceptionSpecificationKind_DynamicNone = 1
    CXCursor_ExceptionSpecificationKind_Dynamic = 2
    CXCursor_ExceptionSpecificationKind_MSAny = 3
    CXCursor_ExceptionSpecificationKind_BasicNoexcept = 4
    CXCursor_ExceptionSpecificationKind_ComputedNoexcept = 5
    CXCursor_ExceptionSpecificationKind_Unevaluated = 6
    CXCursor_ExceptionSpecificationKind_Uninstantiated = 7
    CXCursor_ExceptionSpecificationKind_Unparsed = 8
    CXCursor_ExceptionSpecificationKind_NoThrow = 9
end

function clang_createIndex(excludeDeclarationsFromPCH, displayDiagnostics)
    ccall((:clang_createIndex, libflint3), CXIndex, (Cint, Cint), excludeDeclarationsFromPCH, displayDiagnostics)
end

function clang_disposeIndex(index)
    ccall((:clang_disposeIndex, libflint3), Cvoid, (CXIndex,), index)
end

@cenum CXGlobalOptFlags::UInt32 begin
    CXGlobalOpt_None = 0
    CXGlobalOpt_ThreadBackgroundPriorityForIndexing = 1
    CXGlobalOpt_ThreadBackgroundPriorityForEditing = 2
    CXGlobalOpt_ThreadBackgroundPriorityForAll = 3
end

function clang_CXIndex_setGlobalOptions(arg1, options)
    ccall((:clang_CXIndex_setGlobalOptions, libflint3), Cvoid, (CXIndex, Cuint), arg1, options)
end

function clang_CXIndex_getGlobalOptions(arg1)
    ccall((:clang_CXIndex_getGlobalOptions, libflint3), Cuint, (CXIndex,), arg1)
end

function clang_CXIndex_setInvocationEmissionPathOption(arg1, Path)
    ccall((:clang_CXIndex_setInvocationEmissionPathOption, libflint3), Cvoid, (CXIndex, Ptr{Cchar}), arg1, Path)
end

function clang_isFileMultipleIncludeGuarded(tu, file)
    ccall((:clang_isFileMultipleIncludeGuarded, libflint3), Cuint, (CXTranslationUnit, CXFile), tu, file)
end

function clang_getFile(tu, file_name)
    ccall((:clang_getFile, libflint3), CXFile, (CXTranslationUnit, Ptr{Cchar}), tu, file_name)
end

function clang_getFileContents(tu, file, size)
    ccall((:clang_getFileContents, libflint3), Ptr{Cchar}, (CXTranslationUnit, CXFile, Ptr{Csize_t}), tu, file, size)
end

function clang_getLocation(tu, file, line, column)
    ccall((:clang_getLocation, libflint3), CXSourceLocation, (CXTranslationUnit, CXFile, Cuint, Cuint), tu, file, line, column)
end

function clang_getLocationForOffset(tu, file, offset)
    ccall((:clang_getLocationForOffset, libflint3), CXSourceLocation, (CXTranslationUnit, CXFile, Cuint), tu, file, offset)
end

function clang_getSkippedRanges(tu, file)
    ccall((:clang_getSkippedRanges, libflint3), Ptr{CXSourceRangeList}, (CXTranslationUnit, CXFile), tu, file)
end

function clang_getAllSkippedRanges(tu)
    ccall((:clang_getAllSkippedRanges, libflint3), Ptr{CXSourceRangeList}, (CXTranslationUnit,), tu)
end

function clang_getNumDiagnostics(Unit)
    ccall((:clang_getNumDiagnostics, libflint3), Cuint, (CXTranslationUnit,), Unit)
end

function clang_getDiagnostic(Unit, Index)
    ccall((:clang_getDiagnostic, libflint3), CXDiagnostic, (CXTranslationUnit, Cuint), Unit, Index)
end

function clang_getDiagnosticSetFromTU(Unit)
    ccall((:clang_getDiagnosticSetFromTU, libflint3), CXDiagnosticSet, (CXTranslationUnit,), Unit)
end

function clang_getTranslationUnitSpelling(CTUnit)
    ccall((:clang_getTranslationUnitSpelling, libflint3), CXString, (CXTranslationUnit,), CTUnit)
end

function clang_createTranslationUnitFromSourceFile(CIdx, source_filename, num_clang_command_line_args, clang_command_line_args, num_unsaved_files, unsaved_files)
    ccall((:clang_createTranslationUnitFromSourceFile, libflint3), CXTranslationUnit, (CXIndex, Ptr{Cchar}, Cint, Ptr{Ptr{Cchar}}, Cuint, Ptr{CXUnsavedFile}), CIdx, source_filename, num_clang_command_line_args, clang_command_line_args, num_unsaved_files, unsaved_files)
end

function clang_createTranslationUnit(CIdx, ast_filename)
    ccall((:clang_createTranslationUnit, libflint3), CXTranslationUnit, (CXIndex, Ptr{Cchar}), CIdx, ast_filename)
end

function clang_createTranslationUnit2(CIdx, ast_filename, out_TU)
    ccall((:clang_createTranslationUnit2, libflint3), CXErrorCode, (CXIndex, Ptr{Cchar}, Ptr{CXTranslationUnit}), CIdx, ast_filename, out_TU)
end

@cenum CXTranslationUnit_Flags::UInt32 begin
    CXTranslationUnit_None = 0
    CXTranslationUnit_DetailedPreprocessingRecord = 1
    CXTranslationUnit_Incomplete = 2
    CXTranslationUnit_PrecompiledPreamble = 4
    CXTranslationUnit_CacheCompletionResults = 8
    CXTranslationUnit_ForSerialization = 16
    CXTranslationUnit_CXXChainedPCH = 32
    CXTranslationUnit_SkipFunctionBodies = 64
    CXTranslationUnit_IncludeBriefCommentsInCodeCompletion = 128
    CXTranslationUnit_CreatePreambleOnFirstParse = 256
    CXTranslationUnit_KeepGoing = 512
    CXTranslationUnit_SingleFileParse = 1024
    CXTranslationUnit_LimitSkipFunctionBodiesToPreamble = 2048
    CXTranslationUnit_IncludeAttributedTypes = 4096
    CXTranslationUnit_VisitImplicitAttributes = 8192
    CXTranslationUnit_IgnoreNonErrorsFromIncludedFiles = 16384
    CXTranslationUnit_RetainExcludedConditionalBlocks = 32768
end

function clang_defaultEditingTranslationUnitOptions()
    ccall((:clang_defaultEditingTranslationUnitOptions, libflint3), Cuint, ())
end

function clang_parseTranslationUnit(CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options)
    ccall((:clang_parseTranslationUnit, libflint3), CXTranslationUnit, (CXIndex, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Cint, Ptr{CXUnsavedFile}, Cuint, Cuint), CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options)
end

function clang_parseTranslationUnit2(CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)
    ccall((:clang_parseTranslationUnit2, libflint3), CXErrorCode, (CXIndex, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Cint, Ptr{CXUnsavedFile}, Cuint, Cuint, Ptr{CXTranslationUnit}), CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)
end

function clang_parseTranslationUnit2FullArgv(CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)
    ccall((:clang_parseTranslationUnit2FullArgv, libflint3), CXErrorCode, (CXIndex, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Cint, Ptr{CXUnsavedFile}, Cuint, Cuint, Ptr{CXTranslationUnit}), CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)
end

@cenum CXSaveTranslationUnit_Flags::UInt32 begin
    CXSaveTranslationUnit_None = 0
end

function clang_defaultSaveOptions(TU)
    ccall((:clang_defaultSaveOptions, libflint3), Cuint, (CXTranslationUnit,), TU)
end

@cenum CXSaveError::UInt32 begin
    CXSaveError_None = 0
    CXSaveError_Unknown = 1
    CXSaveError_TranslationErrors = 2
    CXSaveError_InvalidTU = 3
end

function clang_saveTranslationUnit(TU, FileName, options)
    ccall((:clang_saveTranslationUnit, libflint3), Cint, (CXTranslationUnit, Ptr{Cchar}, Cuint), TU, FileName, options)
end

function clang_suspendTranslationUnit(arg1)
    ccall((:clang_suspendTranslationUnit, libflint3), Cuint, (CXTranslationUnit,), arg1)
end

function clang_disposeTranslationUnit(arg1)
    ccall((:clang_disposeTranslationUnit, libflint3), Cvoid, (CXTranslationUnit,), arg1)
end

@cenum CXReparse_Flags::UInt32 begin
    CXReparse_None = 0
end

function clang_defaultReparseOptions(TU)
    ccall((:clang_defaultReparseOptions, libflint3), Cuint, (CXTranslationUnit,), TU)
end

function clang_reparseTranslationUnit(TU, num_unsaved_files, unsaved_files, options)
    ccall((:clang_reparseTranslationUnit, libflint3), Cint, (CXTranslationUnit, Cuint, Ptr{CXUnsavedFile}, Cuint), TU, num_unsaved_files, unsaved_files, options)
end

@cenum CXTUResourceUsageKind::UInt32 begin
    CXTUResourceUsage_AST = 1
    CXTUResourceUsage_Identifiers = 2
    CXTUResourceUsage_Selectors = 3
    CXTUResourceUsage_GlobalCompletionResults = 4
    CXTUResourceUsage_SourceManagerContentCache = 5
    CXTUResourceUsage_AST_SideTables = 6
    CXTUResourceUsage_SourceManager_Membuffer_Malloc = 7
    CXTUResourceUsage_SourceManager_Membuffer_MMap = 8
    CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc = 9
    CXTUResourceUsage_ExternalASTSource_Membuffer_MMap = 10
    CXTUResourceUsage_Preprocessor = 11
    CXTUResourceUsage_PreprocessingRecord = 12
    CXTUResourceUsage_SourceManager_DataStructures = 13
    CXTUResourceUsage_Preprocessor_HeaderSearch = 14
    CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN = 1
    CXTUResourceUsage_MEMORY_IN_BYTES_END = 14
    CXTUResourceUsage_First = 1
    CXTUResourceUsage_Last = 14
end

function clang_getTUResourceUsageName(kind)
    ccall((:clang_getTUResourceUsageName, libflint3), Ptr{Cchar}, (CXTUResourceUsageKind,), kind)
end

struct CXTUResourceUsageEntry
    kind::CXTUResourceUsageKind
    amount::Culong
end

struct CXTUResourceUsage
    data::Ptr{Cvoid}
    numEntries::Cuint
    entries::Ptr{CXTUResourceUsageEntry}
end

function clang_getCXTUResourceUsage(TU)
    ccall((:clang_getCXTUResourceUsage, libflint3), CXTUResourceUsage, (CXTranslationUnit,), TU)
end

function clang_disposeCXTUResourceUsage(usage)
    ccall((:clang_disposeCXTUResourceUsage, libflint3), Cvoid, (CXTUResourceUsage,), usage)
end

function clang_getTranslationUnitTargetInfo(CTUnit)
    ccall((:clang_getTranslationUnitTargetInfo, libflint3), CXTargetInfo, (CXTranslationUnit,), CTUnit)
end

function clang_TargetInfo_dispose(Info)
    ccall((:clang_TargetInfo_dispose, libflint3), Cvoid, (CXTargetInfo,), Info)
end

function clang_TargetInfo_getTriple(Info)
    ccall((:clang_TargetInfo_getTriple, libflint3), CXString, (CXTargetInfo,), Info)
end

function clang_TargetInfo_getPointerWidth(Info)
    ccall((:clang_TargetInfo_getPointerWidth, libflint3), Cint, (CXTargetInfo,), Info)
end

function clang_getNullCursor()
    ccall((:clang_getNullCursor, libflint3), CXCursor, ())
end

function clang_getTranslationUnitCursor(arg1)
    ccall((:clang_getTranslationUnitCursor, libflint3), CXCursor, (CXTranslationUnit,), arg1)
end

function clang_equalCursors(arg1, arg2)
    ccall((:clang_equalCursors, libflint3), Cuint, (CXCursor, CXCursor), arg1, arg2)
end

function clang_Cursor_isNull(cursor)
    ccall((:clang_Cursor_isNull, libflint3), Cint, (CXCursor,), cursor)
end

function clang_hashCursor(arg1)
    ccall((:clang_hashCursor, libflint3), Cuint, (CXCursor,), arg1)
end

function clang_getCursorKind(arg1)
    ccall((:clang_getCursorKind, libflint3), CXCursorKind, (CXCursor,), arg1)
end

function clang_isDeclaration(arg1)
    ccall((:clang_isDeclaration, libflint3), Cuint, (CXCursorKind,), arg1)
end

function clang_isInvalidDeclaration(arg1)
    ccall((:clang_isInvalidDeclaration, libflint3), Cuint, (CXCursor,), arg1)
end

function clang_isReference(arg1)
    ccall((:clang_isReference, libflint3), Cuint, (CXCursorKind,), arg1)
end

function clang_isExpression(arg1)
    ccall((:clang_isExpression, libflint3), Cuint, (CXCursorKind,), arg1)
end

function clang_isStatement(arg1)
    ccall((:clang_isStatement, libflint3), Cuint, (CXCursorKind,), arg1)
end

function clang_isAttribute(arg1)
    ccall((:clang_isAttribute, libflint3), Cuint, (CXCursorKind,), arg1)
end

function clang_Cursor_hasAttrs(C)
    ccall((:clang_Cursor_hasAttrs, libflint3), Cuint, (CXCursor,), C)
end

function clang_isInvalid(arg1)
    ccall((:clang_isInvalid, libflint3), Cuint, (CXCursorKind,), arg1)
end

function clang_isTranslationUnit(arg1)
    ccall((:clang_isTranslationUnit, libflint3), Cuint, (CXCursorKind,), arg1)
end

function clang_isPreprocessing(arg1)
    ccall((:clang_isPreprocessing, libflint3), Cuint, (CXCursorKind,), arg1)
end

function clang_isUnexposed(arg1)
    ccall((:clang_isUnexposed, libflint3), Cuint, (CXCursorKind,), arg1)
end

@cenum CXLinkageKind::UInt32 begin
    CXLinkage_Invalid = 0
    CXLinkage_NoLinkage = 1
    CXLinkage_Internal = 2
    CXLinkage_UniqueExternal = 3
    CXLinkage_External = 4
end

function clang_getCursorLinkage(cursor)
    ccall((:clang_getCursorLinkage, libflint3), CXLinkageKind, (CXCursor,), cursor)
end

@cenum CXVisibilityKind::UInt32 begin
    CXVisibility_Invalid = 0
    CXVisibility_Hidden = 1
    CXVisibility_Protected = 2
    CXVisibility_Default = 3
end

function clang_getCursorVisibility(cursor)
    ccall((:clang_getCursorVisibility, libflint3), CXVisibilityKind, (CXCursor,), cursor)
end

function clang_getCursorAvailability(cursor)
    ccall((:clang_getCursorAvailability, libflint3), CXAvailabilityKind, (CXCursor,), cursor)
end

struct CXPlatformAvailability
    Platform::CXString
    Introduced::CXVersion
    Deprecated::CXVersion
    Obsoleted::CXVersion
    Unavailable::Cint
    Message::CXString
end

function clang_getCursorPlatformAvailability(cursor, always_deprecated, deprecated_message, always_unavailable, unavailable_message, availability, availability_size)
    ccall((:clang_getCursorPlatformAvailability, libflint3), Cint, (CXCursor, Ptr{Cint}, Ptr{CXString}, Ptr{Cint}, Ptr{CXString}, Ptr{CXPlatformAvailability}, Cint), cursor, always_deprecated, deprecated_message, always_unavailable, unavailable_message, availability, availability_size)
end

function clang_disposeCXPlatformAvailability(availability)
    ccall((:clang_disposeCXPlatformAvailability, libflint3), Cvoid, (Ptr{CXPlatformAvailability},), availability)
end

function clang_Cursor_getVarDeclInitializer(cursor)
    ccall((:clang_Cursor_getVarDeclInitializer, libflint3), CXCursor, (CXCursor,), cursor)
end

function clang_Cursor_hasVarDeclGlobalStorage(cursor)
    ccall((:clang_Cursor_hasVarDeclGlobalStorage, libflint3), Cint, (CXCursor,), cursor)
end

function clang_Cursor_hasVarDeclExternalStorage(cursor)
    ccall((:clang_Cursor_hasVarDeclExternalStorage, libflint3), Cint, (CXCursor,), cursor)
end

@cenum CXLanguageKind::UInt32 begin
    CXLanguage_Invalid = 0
    CXLanguage_C = 1
    CXLanguage_ObjC = 2
    CXLanguage_CPlusPlus = 3
end

function clang_getCursorLanguage(cursor)
    ccall((:clang_getCursorLanguage, libflint3), CXLanguageKind, (CXCursor,), cursor)
end

@cenum CXTLSKind::UInt32 begin
    CXTLS_None = 0
    CXTLS_Dynamic = 1
    CXTLS_Static = 2
end

function clang_getCursorTLSKind(cursor)
    ccall((:clang_getCursorTLSKind, libflint3), CXTLSKind, (CXCursor,), cursor)
end

function clang_Cursor_getTranslationUnit(arg1)
    ccall((:clang_Cursor_getTranslationUnit, libflint3), CXTranslationUnit, (CXCursor,), arg1)
end

mutable struct CXCursorSetImpl end

const CXCursorSet = Ptr{CXCursorSetImpl}

function clang_createCXCursorSet()
    ccall((:clang_createCXCursorSet, libflint3), CXCursorSet, ())
end

function clang_disposeCXCursorSet(cset)
    ccall((:clang_disposeCXCursorSet, libflint3), Cvoid, (CXCursorSet,), cset)
end

function clang_CXCursorSet_contains(cset, cursor)
    ccall((:clang_CXCursorSet_contains, libflint3), Cuint, (CXCursorSet, CXCursor), cset, cursor)
end

function clang_CXCursorSet_insert(cset, cursor)
    ccall((:clang_CXCursorSet_insert, libflint3), Cuint, (CXCursorSet, CXCursor), cset, cursor)
end

function clang_getCursorSemanticParent(cursor)
    ccall((:clang_getCursorSemanticParent, libflint3), CXCursor, (CXCursor,), cursor)
end

function clang_getCursorLexicalParent(cursor)
    ccall((:clang_getCursorLexicalParent, libflint3), CXCursor, (CXCursor,), cursor)
end

function clang_getOverriddenCursors(cursor, overridden, num_overridden)
    ccall((:clang_getOverriddenCursors, libflint3), Cvoid, (CXCursor, Ptr{Ptr{CXCursor}}, Ptr{Cuint}), cursor, overridden, num_overridden)
end

function clang_disposeOverriddenCursors(overridden)
    ccall((:clang_disposeOverriddenCursors, libflint3), Cvoid, (Ptr{CXCursor},), overridden)
end

function clang_getIncludedFile(cursor)
    ccall((:clang_getIncludedFile, libflint3), CXFile, (CXCursor,), cursor)
end

function clang_getCursor(arg1, arg2)
    ccall((:clang_getCursor, libflint3), CXCursor, (CXTranslationUnit, CXSourceLocation), arg1, arg2)
end

function clang_getCursorLocation(arg1)
    ccall((:clang_getCursorLocation, libflint3), CXSourceLocation, (CXCursor,), arg1)
end

function clang_getCursorExtent(arg1)
    ccall((:clang_getCursorExtent, libflint3), CXSourceRange, (CXCursor,), arg1)
end

@cenum CXTypeKind::UInt32 begin
    CXType_Invalid = 0
    CXType_Unexposed = 1
    CXType_Void = 2
    CXType_Bool = 3
    CXType_Char_U = 4
    CXType_UChar = 5
    CXType_Char16 = 6
    CXType_Char32 = 7
    CXType_UShort = 8
    CXType_UInt = 9
    CXType_ULong = 10
    CXType_ULongLong = 11
    CXType_UInt128 = 12
    CXType_Char_S = 13
    CXType_SChar = 14
    CXType_WChar = 15
    CXType_Short = 16
    CXType_Int = 17
    CXType_Long = 18
    CXType_LongLong = 19
    CXType_Int128 = 20
    CXType_Float = 21
    CXType_Double = 22
    CXType_LongDouble = 23
    CXType_NullPtr = 24
    CXType_Overload = 25
    CXType_Dependent = 26
    CXType_ObjCId = 27
    CXType_ObjCClass = 28
    CXType_ObjCSel = 29
    CXType_Float128 = 30
    CXType_Half = 31
    CXType_Float16 = 32
    CXType_ShortAccum = 33
    CXType_Accum = 34
    CXType_LongAccum = 35
    CXType_UShortAccum = 36
    CXType_UAccum = 37
    CXType_ULongAccum = 38
    CXType_BFloat16 = 39
    CXType_Ibm128 = 40
    CXType_FirstBuiltin = 2
    CXType_LastBuiltin = 40
    CXType_Complex = 100
    CXType_Pointer = 101
    CXType_BlockPointer = 102
    CXType_LValueReference = 103
    CXType_RValueReference = 104
    CXType_Record = 105
    CXType_Enum = 106
    CXType_Typedef = 107
    CXType_ObjCInterface = 108
    CXType_ObjCObjectPointer = 109
    CXType_FunctionNoProto = 110
    CXType_FunctionProto = 111
    CXType_ConstantArray = 112
    CXType_Vector = 113
    CXType_IncompleteArray = 114
    CXType_VariableArray = 115
    CXType_DependentSizedArray = 116
    CXType_MemberPointer = 117
    CXType_Auto = 118
    CXType_Elaborated = 119
    CXType_Pipe = 120
    CXType_OCLImage1dRO = 121
    CXType_OCLImage1dArrayRO = 122
    CXType_OCLImage1dBufferRO = 123
    CXType_OCLImage2dRO = 124
    CXType_OCLImage2dArrayRO = 125
    CXType_OCLImage2dDepthRO = 126
    CXType_OCLImage2dArrayDepthRO = 127
    CXType_OCLImage2dMSAARO = 128
    CXType_OCLImage2dArrayMSAARO = 129
    CXType_OCLImage2dMSAADepthRO = 130
    CXType_OCLImage2dArrayMSAADepthRO = 131
    CXType_OCLImage3dRO = 132
    CXType_OCLImage1dWO = 133
    CXType_OCLImage1dArrayWO = 134
    CXType_OCLImage1dBufferWO = 135
    CXType_OCLImage2dWO = 136
    CXType_OCLImage2dArrayWO = 137
    CXType_OCLImage2dDepthWO = 138
    CXType_OCLImage2dArrayDepthWO = 139
    CXType_OCLImage2dMSAAWO = 140
    CXType_OCLImage2dArrayMSAAWO = 141
    CXType_OCLImage2dMSAADepthWO = 142
    CXType_OCLImage2dArrayMSAADepthWO = 143
    CXType_OCLImage3dWO = 144
    CXType_OCLImage1dRW = 145
    CXType_OCLImage1dArrayRW = 146
    CXType_OCLImage1dBufferRW = 147
    CXType_OCLImage2dRW = 148
    CXType_OCLImage2dArrayRW = 149
    CXType_OCLImage2dDepthRW = 150
    CXType_OCLImage2dArrayDepthRW = 151
    CXType_OCLImage2dMSAARW = 152
    CXType_OCLImage2dArrayMSAARW = 153
    CXType_OCLImage2dMSAADepthRW = 154
    CXType_OCLImage2dArrayMSAADepthRW = 155
    CXType_OCLImage3dRW = 156
    CXType_OCLSampler = 157
    CXType_OCLEvent = 158
    CXType_OCLQueue = 159
    CXType_OCLReserveID = 160
    CXType_ObjCObject = 161
    CXType_ObjCTypeParam = 162
    CXType_Attributed = 163
    CXType_OCLIntelSubgroupAVCMcePayload = 164
    CXType_OCLIntelSubgroupAVCImePayload = 165
    CXType_OCLIntelSubgroupAVCRefPayload = 166
    CXType_OCLIntelSubgroupAVCSicPayload = 167
    CXType_OCLIntelSubgroupAVCMceResult = 168
    CXType_OCLIntelSubgroupAVCImeResult = 169
    CXType_OCLIntelSubgroupAVCRefResult = 170
    CXType_OCLIntelSubgroupAVCSicResult = 171
    CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout = 172
    CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout = 173
    CXType_OCLIntelSubgroupAVCImeSingleRefStreamin = 174
    CXType_OCLIntelSubgroupAVCImeDualRefStreamin = 175
    CXType_ExtVector = 176
    CXType_Atomic = 177
    CXType_BTFTagAttributed = 178
end

@cenum CXCallingConv::UInt32 begin
    CXCallingConv_Default = 0
    CXCallingConv_C = 1
    CXCallingConv_X86StdCall = 2
    CXCallingConv_X86FastCall = 3
    CXCallingConv_X86ThisCall = 4
    CXCallingConv_X86Pascal = 5
    CXCallingConv_AAPCS = 6
    CXCallingConv_AAPCS_VFP = 7
    CXCallingConv_X86RegCall = 8
    CXCallingConv_IntelOclBicc = 9
    CXCallingConv_Win64 = 10
    CXCallingConv_X86_64Win64 = 10
    CXCallingConv_X86_64SysV = 11
    CXCallingConv_X86VectorCall = 12
    CXCallingConv_Swift = 13
    CXCallingConv_PreserveMost = 14
    CXCallingConv_PreserveAll = 15
    CXCallingConv_AArch64VectorCall = 16
    CXCallingConv_SwiftAsync = 17
    CXCallingConv_AArch64SVEPCS = 18
    CXCallingConv_Invalid = 100
    CXCallingConv_Unexposed = 200
end

struct CXType
    kind::CXTypeKind
    data::NTuple{2, Ptr{Cvoid}}
end

function clang_getCursorType(C)
    ccall((:clang_getCursorType, libflint3), CXType, (CXCursor,), C)
end

function clang_getTypeSpelling(CT)
    ccall((:clang_getTypeSpelling, libflint3), CXString, (CXType,), CT)
end

function clang_getTypedefDeclUnderlyingType(C)
    ccall((:clang_getTypedefDeclUnderlyingType, libflint3), CXType, (CXCursor,), C)
end

function clang_getEnumDeclIntegerType(C)
    ccall((:clang_getEnumDeclIntegerType, libflint3), CXType, (CXCursor,), C)
end

function clang_getEnumConstantDeclValue(C)
    ccall((:clang_getEnumConstantDeclValue, libflint3), Clonglong, (CXCursor,), C)
end

function clang_getEnumConstantDeclUnsignedValue(C)
    ccall((:clang_getEnumConstantDeclUnsignedValue, libflint3), Culonglong, (CXCursor,), C)
end

function clang_getFieldDeclBitWidth(C)
    ccall((:clang_getFieldDeclBitWidth, libflint3), Cint, (CXCursor,), C)
end

function clang_Cursor_getNumArguments(C)
    ccall((:clang_Cursor_getNumArguments, libflint3), Cint, (CXCursor,), C)
end

function clang_Cursor_getArgument(C, i)
    ccall((:clang_Cursor_getArgument, libflint3), CXCursor, (CXCursor, Cuint), C, i)
end

@cenum CXTemplateArgumentKind::UInt32 begin
    CXTemplateArgumentKind_Null = 0
    CXTemplateArgumentKind_Type = 1
    CXTemplateArgumentKind_Declaration = 2
    CXTemplateArgumentKind_NullPtr = 3
    CXTemplateArgumentKind_Integral = 4
    CXTemplateArgumentKind_Template = 5
    CXTemplateArgumentKind_TemplateExpansion = 6
    CXTemplateArgumentKind_Expression = 7
    CXTemplateArgumentKind_Pack = 8
    CXTemplateArgumentKind_Invalid = 9
end

function clang_Cursor_getNumTemplateArguments(C)
    ccall((:clang_Cursor_getNumTemplateArguments, libflint3), Cint, (CXCursor,), C)
end

function clang_Cursor_getTemplateArgumentKind(C, I)
    ccall((:clang_Cursor_getTemplateArgumentKind, libflint3), CXTemplateArgumentKind, (CXCursor, Cuint), C, I)
end

function clang_Cursor_getTemplateArgumentType(C, I)
    ccall((:clang_Cursor_getTemplateArgumentType, libflint3), CXType, (CXCursor, Cuint), C, I)
end

function clang_Cursor_getTemplateArgumentValue(C, I)
    ccall((:clang_Cursor_getTemplateArgumentValue, libflint3), Clonglong, (CXCursor, Cuint), C, I)
end

function clang_Cursor_getTemplateArgumentUnsignedValue(C, I)
    ccall((:clang_Cursor_getTemplateArgumentUnsignedValue, libflint3), Culonglong, (CXCursor, Cuint), C, I)
end

function clang_equalTypes(A, B)
    ccall((:clang_equalTypes, libflint3), Cuint, (CXType, CXType), A, B)
end

function clang_getCanonicalType(T)
    ccall((:clang_getCanonicalType, libflint3), CXType, (CXType,), T)
end

function clang_isConstQualifiedType(T)
    ccall((:clang_isConstQualifiedType, libflint3), Cuint, (CXType,), T)
end

function clang_Cursor_isMacroFunctionLike(C)
    ccall((:clang_Cursor_isMacroFunctionLike, libflint3), Cuint, (CXCursor,), C)
end

function clang_Cursor_isMacroBuiltin(C)
    ccall((:clang_Cursor_isMacroBuiltin, libflint3), Cuint, (CXCursor,), C)
end

function clang_Cursor_isFunctionInlined(C)
    ccall((:clang_Cursor_isFunctionInlined, libflint3), Cuint, (CXCursor,), C)
end

function clang_isVolatileQualifiedType(T)
    ccall((:clang_isVolatileQualifiedType, libflint3), Cuint, (CXType,), T)
end

function clang_isRestrictQualifiedType(T)
    ccall((:clang_isRestrictQualifiedType, libflint3), Cuint, (CXType,), T)
end

function clang_getAddressSpace(T)
    ccall((:clang_getAddressSpace, libflint3), Cuint, (CXType,), T)
end

function clang_getTypedefName(CT)
    ccall((:clang_getTypedefName, libflint3), CXString, (CXType,), CT)
end

function clang_getPointeeType(T)
    ccall((:clang_getPointeeType, libflint3), CXType, (CXType,), T)
end

function clang_getUnqualifiedType(CT)
    ccall((:clang_getUnqualifiedType, libflint3), CXType, (CXType,), CT)
end

function clang_getNonReferenceType(CT)
    ccall((:clang_getNonReferenceType, libflint3), CXType, (CXType,), CT)
end

function clang_getTypeDeclaration(T)
    ccall((:clang_getTypeDeclaration, libflint3), CXCursor, (CXType,), T)
end

function clang_getDeclObjCTypeEncoding(C)
    ccall((:clang_getDeclObjCTypeEncoding, libflint3), CXString, (CXCursor,), C)
end

function clang_Type_getObjCEncoding(type)
    ccall((:clang_Type_getObjCEncoding, libflint3), CXString, (CXType,), type)
end

function clang_getTypeKindSpelling(K)
    ccall((:clang_getTypeKindSpelling, libflint3), CXString, (CXTypeKind,), K)
end

function clang_getFunctionTypeCallingConv(T)
    ccall((:clang_getFunctionTypeCallingConv, libflint3), CXCallingConv, (CXType,), T)
end

function clang_getResultType(T)
    ccall((:clang_getResultType, libflint3), CXType, (CXType,), T)
end

function clang_getExceptionSpecificationType(T)
    ccall((:clang_getExceptionSpecificationType, libflint3), Cint, (CXType,), T)
end

function clang_getNumArgTypes(T)
    ccall((:clang_getNumArgTypes, libflint3), Cint, (CXType,), T)
end

function clang_getArgType(T, i)
    ccall((:clang_getArgType, libflint3), CXType, (CXType, Cuint), T, i)
end

function clang_Type_getObjCObjectBaseType(T)
    ccall((:clang_Type_getObjCObjectBaseType, libflint3), CXType, (CXType,), T)
end

function clang_Type_getNumObjCProtocolRefs(T)
    ccall((:clang_Type_getNumObjCProtocolRefs, libflint3), Cuint, (CXType,), T)
end

function clang_Type_getObjCProtocolDecl(T, i)
    ccall((:clang_Type_getObjCProtocolDecl, libflint3), CXCursor, (CXType, Cuint), T, i)
end

function clang_Type_getNumObjCTypeArgs(T)
    ccall((:clang_Type_getNumObjCTypeArgs, libflint3), Cuint, (CXType,), T)
end

function clang_Type_getObjCTypeArg(T, i)
    ccall((:clang_Type_getObjCTypeArg, libflint3), CXType, (CXType, Cuint), T, i)
end

function clang_isFunctionTypeVariadic(T)
    ccall((:clang_isFunctionTypeVariadic, libflint3), Cuint, (CXType,), T)
end

function clang_getCursorResultType(C)
    ccall((:clang_getCursorResultType, libflint3), CXType, (CXCursor,), C)
end

function clang_getCursorExceptionSpecificationType(C)
    ccall((:clang_getCursorExceptionSpecificationType, libflint3), Cint, (CXCursor,), C)
end

function clang_isPODType(T)
    ccall((:clang_isPODType, libflint3), Cuint, (CXType,), T)
end

function clang_getElementType(T)
    ccall((:clang_getElementType, libflint3), CXType, (CXType,), T)
end

function clang_getNumElements(T)
    ccall((:clang_getNumElements, libflint3), Clonglong, (CXType,), T)
end

function clang_getArrayElementType(T)
    ccall((:clang_getArrayElementType, libflint3), CXType, (CXType,), T)
end

function clang_getArraySize(T)
    ccall((:clang_getArraySize, libflint3), Clonglong, (CXType,), T)
end

function clang_Type_getNamedType(T)
    ccall((:clang_Type_getNamedType, libflint3), CXType, (CXType,), T)
end

function clang_Type_isTransparentTagTypedef(T)
    ccall((:clang_Type_isTransparentTagTypedef, libflint3), Cuint, (CXType,), T)
end

@cenum CXTypeNullabilityKind::UInt32 begin
    CXTypeNullability_NonNull = 0
    CXTypeNullability_Nullable = 1
    CXTypeNullability_Unspecified = 2
    CXTypeNullability_Invalid = 3
    CXTypeNullability_NullableResult = 4
end

function clang_Type_getNullability(T)
    ccall((:clang_Type_getNullability, libflint3), CXTypeNullabilityKind, (CXType,), T)
end

@cenum CXTypeLayoutError::Int32 begin
    CXTypeLayoutError_Invalid = -1
    CXTypeLayoutError_Incomplete = -2
    CXTypeLayoutError_Dependent = -3
    CXTypeLayoutError_NotConstantSize = -4
    CXTypeLayoutError_InvalidFieldName = -5
    CXTypeLayoutError_Undeduced = -6
end

function clang_Type_getAlignOf(T)
    ccall((:clang_Type_getAlignOf, libflint3), Clonglong, (CXType,), T)
end

function clang_Type_getClassType(T)
    ccall((:clang_Type_getClassType, libflint3), CXType, (CXType,), T)
end

function clang_Type_getSizeOf(T)
    ccall((:clang_Type_getSizeOf, libflint3), Clonglong, (CXType,), T)
end

function clang_Type_getOffsetOf(T, S)
    ccall((:clang_Type_getOffsetOf, libflint3), Clonglong, (CXType, Ptr{Cchar}), T, S)
end

function clang_Type_getModifiedType(T)
    ccall((:clang_Type_getModifiedType, libflint3), CXType, (CXType,), T)
end

function clang_Type_getValueType(CT)
    ccall((:clang_Type_getValueType, libflint3), CXType, (CXType,), CT)
end

function clang_Cursor_getOffsetOfField(C)
    ccall((:clang_Cursor_getOffsetOfField, libflint3), Clonglong, (CXCursor,), C)
end

function clang_Cursor_isAnonymous(C)
    ccall((:clang_Cursor_isAnonymous, libflint3), Cuint, (CXCursor,), C)
end

function clang_Cursor_isAnonymousRecordDecl(C)
    ccall((:clang_Cursor_isAnonymousRecordDecl, libflint3), Cuint, (CXCursor,), C)
end

function clang_Cursor_isInlineNamespace(C)
    ccall((:clang_Cursor_isInlineNamespace, libflint3), Cuint, (CXCursor,), C)
end

@cenum CXRefQualifierKind::UInt32 begin
    CXRefQualifier_None = 0
    CXRefQualifier_LValue = 1
    CXRefQualifier_RValue = 2
end

function clang_Type_getNumTemplateArguments(T)
    ccall((:clang_Type_getNumTemplateArguments, libflint3), Cint, (CXType,), T)
end

function clang_Type_getTemplateArgumentAsType(T, i)
    ccall((:clang_Type_getTemplateArgumentAsType, libflint3), CXType, (CXType, Cuint), T, i)
end

function clang_Type_getCXXRefQualifier(T)
    ccall((:clang_Type_getCXXRefQualifier, libflint3), CXRefQualifierKind, (CXType,), T)
end

function clang_Cursor_isBitField(C)
    ccall((:clang_Cursor_isBitField, libflint3), Cuint, (CXCursor,), C)
end

function clang_isVirtualBase(arg1)
    ccall((:clang_isVirtualBase, libflint3), Cuint, (CXCursor,), arg1)
end

@cenum CX_CXXAccessSpecifier::UInt32 begin
    CX_CXXInvalidAccessSpecifier = 0
    CX_CXXPublic = 1
    CX_CXXProtected = 2
    CX_CXXPrivate = 3
end

function clang_getCXXAccessSpecifier(arg1)
    ccall((:clang_getCXXAccessSpecifier, libflint3), CX_CXXAccessSpecifier, (CXCursor,), arg1)
end

@cenum CX_StorageClass::UInt32 begin
    CX_SC_Invalid = 0
    CX_SC_None = 1
    CX_SC_Extern = 2
    CX_SC_Static = 3
    CX_SC_PrivateExtern = 4
    CX_SC_OpenCLWorkGroupLocal = 5
    CX_SC_Auto = 6
    CX_SC_Register = 7
end

function clang_Cursor_getStorageClass(arg1)
    ccall((:clang_Cursor_getStorageClass, libflint3), CX_StorageClass, (CXCursor,), arg1)
end

function clang_getNumOverloadedDecls(cursor)
    ccall((:clang_getNumOverloadedDecls, libflint3), Cuint, (CXCursor,), cursor)
end

function clang_getOverloadedDecl(cursor, index)
    ccall((:clang_getOverloadedDecl, libflint3), CXCursor, (CXCursor, Cuint), cursor, index)
end

function clang_getIBOutletCollectionType(arg1)
    ccall((:clang_getIBOutletCollectionType, libflint3), CXType, (CXCursor,), arg1)
end

@cenum CXChildVisitResult::UInt32 begin
    CXChildVisit_Break = 0
    CXChildVisit_Continue = 1
    CXChildVisit_Recurse = 2
end

# typedef enum CXChildVisitResult ( * CXCursorVisitor ) ( CXCursor cursor , CXCursor parent , CXClientData client_data )
const CXCursorVisitor = Ptr{Cvoid}

function clang_visitChildren(parent, visitor, client_data)
    ccall((:clang_visitChildren, libflint3), Cuint, (CXCursor, CXCursorVisitor, CXClientData), parent, visitor, client_data)
end

function clang_getCursorUSR(arg1)
    ccall((:clang_getCursorUSR, libflint3), CXString, (CXCursor,), arg1)
end

function clang_constructUSR_ObjCClass(class_name)
    ccall((:clang_constructUSR_ObjCClass, libflint3), CXString, (Ptr{Cchar},), class_name)
end

function clang_constructUSR_ObjCCategory(class_name, category_name)
    ccall((:clang_constructUSR_ObjCCategory, libflint3), CXString, (Ptr{Cchar}, Ptr{Cchar}), class_name, category_name)
end

function clang_constructUSR_ObjCProtocol(protocol_name)
    ccall((:clang_constructUSR_ObjCProtocol, libflint3), CXString, (Ptr{Cchar},), protocol_name)
end

function clang_constructUSR_ObjCIvar(name, classUSR)
    ccall((:clang_constructUSR_ObjCIvar, libflint3), CXString, (Ptr{Cchar}, CXString), name, classUSR)
end

function clang_constructUSR_ObjCMethod(name, isInstanceMethod, classUSR)
    ccall((:clang_constructUSR_ObjCMethod, libflint3), CXString, (Ptr{Cchar}, Cuint, CXString), name, isInstanceMethod, classUSR)
end

function clang_constructUSR_ObjCProperty(property, classUSR)
    ccall((:clang_constructUSR_ObjCProperty, libflint3), CXString, (Ptr{Cchar}, CXString), property, classUSR)
end

function clang_getCursorSpelling(arg1)
    ccall((:clang_getCursorSpelling, libflint3), CXString, (CXCursor,), arg1)
end

function clang_Cursor_getSpellingNameRange(arg1, pieceIndex, options)
    ccall((:clang_Cursor_getSpellingNameRange, libflint3), CXSourceRange, (CXCursor, Cuint, Cuint), arg1, pieceIndex, options)
end

const CXPrintingPolicy = Ptr{Cvoid}

@cenum CXPrintingPolicyProperty::UInt32 begin
    CXPrintingPolicy_Indentation = 0
    CXPrintingPolicy_SuppressSpecifiers = 1
    CXPrintingPolicy_SuppressTagKeyword = 2
    CXPrintingPolicy_IncludeTagDefinition = 3
    CXPrintingPolicy_SuppressScope = 4
    CXPrintingPolicy_SuppressUnwrittenScope = 5
    CXPrintingPolicy_SuppressInitializers = 6
    CXPrintingPolicy_ConstantArraySizeAsWritten = 7
    CXPrintingPolicy_AnonymousTagLocations = 8
    CXPrintingPolicy_SuppressStrongLifetime = 9
    CXPrintingPolicy_SuppressLifetimeQualifiers = 10
    CXPrintingPolicy_SuppressTemplateArgsInCXXConstructors = 11
    CXPrintingPolicy_Bool = 12
    CXPrintingPolicy_Restrict = 13
    CXPrintingPolicy_Alignof = 14
    CXPrintingPolicy_UnderscoreAlignof = 15
    CXPrintingPolicy_UseVoidForZeroParams = 16
    CXPrintingPolicy_TerseOutput = 17
    CXPrintingPolicy_PolishForDeclaration = 18
    CXPrintingPolicy_Half = 19
    CXPrintingPolicy_MSWChar = 20
    CXPrintingPolicy_IncludeNewlines = 21
    CXPrintingPolicy_MSVCFormatting = 22
    CXPrintingPolicy_ConstantsAsWritten = 23
    CXPrintingPolicy_SuppressImplicitBase = 24
    CXPrintingPolicy_FullyQualifiedName = 25
    CXPrintingPolicy_LastProperty = 25
end

function clang_PrintingPolicy_getProperty(Policy, Property)
    ccall((:clang_PrintingPolicy_getProperty, libflint3), Cuint, (CXPrintingPolicy, CXPrintingPolicyProperty), Policy, Property)
end

function clang_PrintingPolicy_setProperty(Policy, Property, Value)
    ccall((:clang_PrintingPolicy_setProperty, libflint3), Cvoid, (CXPrintingPolicy, CXPrintingPolicyProperty, Cuint), Policy, Property, Value)
end

function clang_getCursorPrintingPolicy(arg1)
    ccall((:clang_getCursorPrintingPolicy, libflint3), CXPrintingPolicy, (CXCursor,), arg1)
end

function clang_PrintingPolicy_dispose(Policy)
    ccall((:clang_PrintingPolicy_dispose, libflint3), Cvoid, (CXPrintingPolicy,), Policy)
end

function clang_getCursorPrettyPrinted(Cursor, Policy)
    ccall((:clang_getCursorPrettyPrinted, libflint3), CXString, (CXCursor, CXPrintingPolicy), Cursor, Policy)
end

function clang_getCursorDisplayName(arg1)
    ccall((:clang_getCursorDisplayName, libflint3), CXString, (CXCursor,), arg1)
end

function clang_getCursorReferenced(arg1)
    ccall((:clang_getCursorReferenced, libflint3), CXCursor, (CXCursor,), arg1)
end

function clang_getCursorDefinition(arg1)
    ccall((:clang_getCursorDefinition, libflint3), CXCursor, (CXCursor,), arg1)
end

function clang_isCursorDefinition(arg1)
    ccall((:clang_isCursorDefinition, libflint3), Cuint, (CXCursor,), arg1)
end

function clang_getCanonicalCursor(arg1)
    ccall((:clang_getCanonicalCursor, libflint3), CXCursor, (CXCursor,), arg1)
end

function clang_Cursor_getObjCSelectorIndex(arg1)
    ccall((:clang_Cursor_getObjCSelectorIndex, libflint3), Cint, (CXCursor,), arg1)
end

function clang_Cursor_isDynamicCall(C)
    ccall((:clang_Cursor_isDynamicCall, libflint3), Cint, (CXCursor,), C)
end

function clang_Cursor_getReceiverType(C)
    ccall((:clang_Cursor_getReceiverType, libflint3), CXType, (CXCursor,), C)
end

@cenum CXObjCPropertyAttrKind::UInt32 begin
    CXObjCPropertyAttr_noattr = 0
    CXObjCPropertyAttr_readonly = 1
    CXObjCPropertyAttr_getter = 2
    CXObjCPropertyAttr_assign = 4
    CXObjCPropertyAttr_readwrite = 8
    CXObjCPropertyAttr_retain = 16
    CXObjCPropertyAttr_copy = 32
    CXObjCPropertyAttr_nonatomic = 64
    CXObjCPropertyAttr_setter = 128
    CXObjCPropertyAttr_atomic = 256
    CXObjCPropertyAttr_weak = 512
    CXObjCPropertyAttr_strong = 1024
    CXObjCPropertyAttr_unsafe_unretained = 2048
    CXObjCPropertyAttr_class = 4096
end

function clang_Cursor_getObjCPropertyAttributes(C, reserved)
    ccall((:clang_Cursor_getObjCPropertyAttributes, libflint3), Cuint, (CXCursor, Cuint), C, reserved)
end

function clang_Cursor_getObjCPropertyGetterName(C)
    ccall((:clang_Cursor_getObjCPropertyGetterName, libflint3), CXString, (CXCursor,), C)
end

function clang_Cursor_getObjCPropertySetterName(C)
    ccall((:clang_Cursor_getObjCPropertySetterName, libflint3), CXString, (CXCursor,), C)
end

@cenum CXObjCDeclQualifierKind::UInt32 begin
    CXObjCDeclQualifier_None = 0
    CXObjCDeclQualifier_In = 1
    CXObjCDeclQualifier_Inout = 2
    CXObjCDeclQualifier_Out = 4
    CXObjCDeclQualifier_Bycopy = 8
    CXObjCDeclQualifier_Byref = 16
    CXObjCDeclQualifier_Oneway = 32
end

function clang_Cursor_getObjCDeclQualifiers(C)
    ccall((:clang_Cursor_getObjCDeclQualifiers, libflint3), Cuint, (CXCursor,), C)
end

function clang_Cursor_isObjCOptional(C)
    ccall((:clang_Cursor_isObjCOptional, libflint3), Cuint, (CXCursor,), C)
end

function clang_Cursor_isVariadic(C)
    ccall((:clang_Cursor_isVariadic, libflint3), Cuint, (CXCursor,), C)
end

function clang_Cursor_isExternalSymbol(C, language, definedIn, isGenerated)
    ccall((:clang_Cursor_isExternalSymbol, libflint3), Cuint, (CXCursor, Ptr{CXString}, Ptr{CXString}, Ptr{Cuint}), C, language, definedIn, isGenerated)
end

function clang_Cursor_getCommentRange(C)
    ccall((:clang_Cursor_getCommentRange, libflint3), CXSourceRange, (CXCursor,), C)
end

function clang_Cursor_getRawCommentText(C)
    ccall((:clang_Cursor_getRawCommentText, libflint3), CXString, (CXCursor,), C)
end

function clang_Cursor_getBriefCommentText(C)
    ccall((:clang_Cursor_getBriefCommentText, libflint3), CXString, (CXCursor,), C)
end

function clang_Cursor_getMangling(arg1)
    ccall((:clang_Cursor_getMangling, libflint3), CXString, (CXCursor,), arg1)
end

function clang_Cursor_getCXXManglings(arg1)
    ccall((:clang_Cursor_getCXXManglings, libflint3), Ptr{CXStringSet}, (CXCursor,), arg1)
end

function clang_Cursor_getObjCManglings(arg1)
    ccall((:clang_Cursor_getObjCManglings, libflint3), Ptr{CXStringSet}, (CXCursor,), arg1)
end

const CXModule = Ptr{Cvoid}

function clang_Cursor_getModule(C)
    ccall((:clang_Cursor_getModule, libflint3), CXModule, (CXCursor,), C)
end

function clang_getModuleForFile(arg1, arg2)
    ccall((:clang_getModuleForFile, libflint3), CXModule, (CXTranslationUnit, CXFile), arg1, arg2)
end

function clang_Module_getASTFile(Module)
    ccall((:clang_Module_getASTFile, libflint3), CXFile, (CXModule,), Module)
end

function clang_Module_getParent(Module)
    ccall((:clang_Module_getParent, libflint3), CXModule, (CXModule,), Module)
end

function clang_Module_getName(Module)
    ccall((:clang_Module_getName, libflint3), CXString, (CXModule,), Module)
end

function clang_Module_getFullName(Module)
    ccall((:clang_Module_getFullName, libflint3), CXString, (CXModule,), Module)
end

function clang_Module_isSystem(Module)
    ccall((:clang_Module_isSystem, libflint3), Cint, (CXModule,), Module)
end

function clang_Module_getNumTopLevelHeaders(arg1, Module)
    ccall((:clang_Module_getNumTopLevelHeaders, libflint3), Cuint, (CXTranslationUnit, CXModule), arg1, Module)
end

function clang_Module_getTopLevelHeader(arg1, Module, Index)
    ccall((:clang_Module_getTopLevelHeader, libflint3), CXFile, (CXTranslationUnit, CXModule, Cuint), arg1, Module, Index)
end

function clang_CXXConstructor_isConvertingConstructor(C)
    ccall((:clang_CXXConstructor_isConvertingConstructor, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXConstructor_isCopyConstructor(C)
    ccall((:clang_CXXConstructor_isCopyConstructor, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXConstructor_isDefaultConstructor(C)
    ccall((:clang_CXXConstructor_isDefaultConstructor, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXConstructor_isMoveConstructor(C)
    ccall((:clang_CXXConstructor_isMoveConstructor, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXField_isMutable(C)
    ccall((:clang_CXXField_isMutable, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXMethod_isDefaulted(C)
    ccall((:clang_CXXMethod_isDefaulted, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXMethod_isDeleted(C)
    ccall((:clang_CXXMethod_isDeleted, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXMethod_isPureVirtual(C)
    ccall((:clang_CXXMethod_isPureVirtual, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXMethod_isStatic(C)
    ccall((:clang_CXXMethod_isStatic, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXMethod_isVirtual(C)
    ccall((:clang_CXXMethod_isVirtual, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXMethod_isCopyAssignmentOperator(C)
    ccall((:clang_CXXMethod_isCopyAssignmentOperator, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXMethod_isMoveAssignmentOperator(C)
    ccall((:clang_CXXMethod_isMoveAssignmentOperator, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXRecord_isAbstract(C)
    ccall((:clang_CXXRecord_isAbstract, libflint3), Cuint, (CXCursor,), C)
end

function clang_EnumDecl_isScoped(C)
    ccall((:clang_EnumDecl_isScoped, libflint3), Cuint, (CXCursor,), C)
end

function clang_CXXMethod_isConst(C)
    ccall((:clang_CXXMethod_isConst, libflint3), Cuint, (CXCursor,), C)
end

function clang_getTemplateCursorKind(C)
    ccall((:clang_getTemplateCursorKind, libflint3), CXCursorKind, (CXCursor,), C)
end

function clang_getSpecializedCursorTemplate(C)
    ccall((:clang_getSpecializedCursorTemplate, libflint3), CXCursor, (CXCursor,), C)
end

function clang_getCursorReferenceNameRange(C, NameFlags, PieceIndex)
    ccall((:clang_getCursorReferenceNameRange, libflint3), CXSourceRange, (CXCursor, Cuint, Cuint), C, NameFlags, PieceIndex)
end

@cenum CXNameRefFlags::UInt32 begin
    CXNameRange_WantQualifier = 1
    CXNameRange_WantTemplateArgs = 2
    CXNameRange_WantSinglePiece = 4
end

@cenum CXTokenKind::UInt32 begin
    CXToken_Punctuation = 0
    CXToken_Keyword = 1
    CXToken_Identifier = 2
    CXToken_Literal = 3
    CXToken_Comment = 4
end

struct CXToken
    int_data::NTuple{4, Cuint}
    ptr_data::Ptr{Cvoid}
end

function clang_getToken(TU, Location)
    ccall((:clang_getToken, libflint3), Ptr{CXToken}, (CXTranslationUnit, CXSourceLocation), TU, Location)
end

function clang_getTokenKind(arg1)
    ccall((:clang_getTokenKind, libflint3), CXTokenKind, (CXToken,), arg1)
end

function clang_getTokenSpelling(arg1, arg2)
    ccall((:clang_getTokenSpelling, libflint3), CXString, (CXTranslationUnit, CXToken), arg1, arg2)
end

function clang_getTokenLocation(arg1, arg2)
    ccall((:clang_getTokenLocation, libflint3), CXSourceLocation, (CXTranslationUnit, CXToken), arg1, arg2)
end

function clang_getTokenExtent(arg1, arg2)
    ccall((:clang_getTokenExtent, libflint3), CXSourceRange, (CXTranslationUnit, CXToken), arg1, arg2)
end

function clang_tokenize(TU, Range, Tokens, NumTokens)
    ccall((:clang_tokenize, libflint3), Cvoid, (CXTranslationUnit, CXSourceRange, Ptr{Ptr{CXToken}}, Ptr{Cuint}), TU, Range, Tokens, NumTokens)
end

function clang_annotateTokens(TU, Tokens, NumTokens, Cursors)
    ccall((:clang_annotateTokens, libflint3), Cvoid, (CXTranslationUnit, Ptr{CXToken}, Cuint, Ptr{CXCursor}), TU, Tokens, NumTokens, Cursors)
end

function clang_disposeTokens(TU, Tokens, NumTokens)
    ccall((:clang_disposeTokens, libflint3), Cvoid, (CXTranslationUnit, Ptr{CXToken}, Cuint), TU, Tokens, NumTokens)
end

function clang_getCursorKindSpelling(Kind)
    ccall((:clang_getCursorKindSpelling, libflint3), CXString, (CXCursorKind,), Kind)
end

function clang_getDefinitionSpellingAndExtent(arg1, startBuf, endBuf, startLine, startColumn, endLine, endColumn)
    ccall((:clang_getDefinitionSpellingAndExtent, libflint3), Cvoid, (CXCursor, Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), arg1, startBuf, endBuf, startLine, startColumn, endLine, endColumn)
end

function clang_enableStackTraces()
    ccall((:clang_enableStackTraces, libflint3), Cvoid, ())
end

function clang_executeOnThread(fn, user_data, stack_size)
    ccall((:clang_executeOnThread, libflint3), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Cuint), fn, user_data, stack_size)
end

const CXCompletionString = Ptr{Cvoid}

struct CXCompletionResult
    CursorKind::CXCursorKind
    CompletionString::CXCompletionString
end

@cenum CXCompletionChunkKind::UInt32 begin
    CXCompletionChunk_Optional = 0
    CXCompletionChunk_TypedText = 1
    CXCompletionChunk_Text = 2
    CXCompletionChunk_Placeholder = 3
    CXCompletionChunk_Informative = 4
    CXCompletionChunk_CurrentParameter = 5
    CXCompletionChunk_LeftParen = 6
    CXCompletionChunk_RightParen = 7
    CXCompletionChunk_LeftBracket = 8
    CXCompletionChunk_RightBracket = 9
    CXCompletionChunk_LeftBrace = 10
    CXCompletionChunk_RightBrace = 11
    CXCompletionChunk_LeftAngle = 12
    CXCompletionChunk_RightAngle = 13
    CXCompletionChunk_Comma = 14
    CXCompletionChunk_ResultType = 15
    CXCompletionChunk_Colon = 16
    CXCompletionChunk_SemiColon = 17
    CXCompletionChunk_Equal = 18
    CXCompletionChunk_HorizontalSpace = 19
    CXCompletionChunk_VerticalSpace = 20
end

function clang_getCompletionChunkKind(completion_string, chunk_number)
    ccall((:clang_getCompletionChunkKind, libflint3), CXCompletionChunkKind, (CXCompletionString, Cuint), completion_string, chunk_number)
end

function clang_getCompletionChunkText(completion_string, chunk_number)
    ccall((:clang_getCompletionChunkText, libflint3), CXString, (CXCompletionString, Cuint), completion_string, chunk_number)
end

function clang_getCompletionChunkCompletionString(completion_string, chunk_number)
    ccall((:clang_getCompletionChunkCompletionString, libflint3), CXCompletionString, (CXCompletionString, Cuint), completion_string, chunk_number)
end

function clang_getNumCompletionChunks(completion_string)
    ccall((:clang_getNumCompletionChunks, libflint3), Cuint, (CXCompletionString,), completion_string)
end

function clang_getCompletionPriority(completion_string)
    ccall((:clang_getCompletionPriority, libflint3), Cuint, (CXCompletionString,), completion_string)
end

function clang_getCompletionAvailability(completion_string)
    ccall((:clang_getCompletionAvailability, libflint3), CXAvailabilityKind, (CXCompletionString,), completion_string)
end

function clang_getCompletionNumAnnotations(completion_string)
    ccall((:clang_getCompletionNumAnnotations, libflint3), Cuint, (CXCompletionString,), completion_string)
end

function clang_getCompletionAnnotation(completion_string, annotation_number)
    ccall((:clang_getCompletionAnnotation, libflint3), CXString, (CXCompletionString, Cuint), completion_string, annotation_number)
end

function clang_getCompletionParent(completion_string, kind)
    ccall((:clang_getCompletionParent, libflint3), CXString, (CXCompletionString, Ptr{CXCursorKind}), completion_string, kind)
end

function clang_getCompletionBriefComment(completion_string)
    ccall((:clang_getCompletionBriefComment, libflint3), CXString, (CXCompletionString,), completion_string)
end

function clang_getCursorCompletionString(cursor)
    ccall((:clang_getCursorCompletionString, libflint3), CXCompletionString, (CXCursor,), cursor)
end

struct CXCodeCompleteResults
    Results::Ptr{CXCompletionResult}
    NumResults::Cuint
end

function clang_getCompletionNumFixIts(results, completion_index)
    ccall((:clang_getCompletionNumFixIts, libflint3), Cuint, (Ptr{CXCodeCompleteResults}, Cuint), results, completion_index)
end

function clang_getCompletionFixIt(results, completion_index, fixit_index, replacement_range)
    ccall((:clang_getCompletionFixIt, libflint3), CXString, (Ptr{CXCodeCompleteResults}, Cuint, Cuint, Ptr{CXSourceRange}), results, completion_index, fixit_index, replacement_range)
end

@cenum CXCodeComplete_Flags::UInt32 begin
    CXCodeComplete_IncludeMacros = 1
    CXCodeComplete_IncludeCodePatterns = 2
    CXCodeComplete_IncludeBriefComments = 4
    CXCodeComplete_SkipPreamble = 8
    CXCodeComplete_IncludeCompletionsWithFixIts = 16
end

@cenum CXCompletionContext::UInt32 begin
    CXCompletionContext_Unexposed = 0
    CXCompletionContext_AnyType = 1
    CXCompletionContext_AnyValue = 2
    CXCompletionContext_ObjCObjectValue = 4
    CXCompletionContext_ObjCSelectorValue = 8
    CXCompletionContext_CXXClassTypeValue = 16
    CXCompletionContext_DotMemberAccess = 32
    CXCompletionContext_ArrowMemberAccess = 64
    CXCompletionContext_ObjCPropertyAccess = 128
    CXCompletionContext_EnumTag = 256
    CXCompletionContext_UnionTag = 512
    CXCompletionContext_StructTag = 1024
    CXCompletionContext_ClassTag = 2048
    CXCompletionContext_Namespace = 4096
    CXCompletionContext_NestedNameSpecifier = 8192
    CXCompletionContext_ObjCInterface = 16384
    CXCompletionContext_ObjCProtocol = 32768
    CXCompletionContext_ObjCCategory = 65536
    CXCompletionContext_ObjCInstanceMessage = 131072
    CXCompletionContext_ObjCClassMessage = 262144
    CXCompletionContext_ObjCSelectorName = 524288
    CXCompletionContext_MacroName = 1048576
    CXCompletionContext_NaturalLanguage = 2097152
    CXCompletionContext_IncludedFile = 4194304
    CXCompletionContext_Unknown = 8388607
end

function clang_defaultCodeCompleteOptions()
    ccall((:clang_defaultCodeCompleteOptions, libflint3), Cuint, ())
end

function clang_codeCompleteAt(TU, complete_filename, complete_line, complete_column, unsaved_files, num_unsaved_files, options)
    ccall((:clang_codeCompleteAt, libflint3), Ptr{CXCodeCompleteResults}, (CXTranslationUnit, Ptr{Cchar}, Cuint, Cuint, Ptr{CXUnsavedFile}, Cuint, Cuint), TU, complete_filename, complete_line, complete_column, unsaved_files, num_unsaved_files, options)
end

function clang_sortCodeCompletionResults(Results, NumResults)
    ccall((:clang_sortCodeCompletionResults, libflint3), Cvoid, (Ptr{CXCompletionResult}, Cuint), Results, NumResults)
end

function clang_disposeCodeCompleteResults(Results)
    ccall((:clang_disposeCodeCompleteResults, libflint3), Cvoid, (Ptr{CXCodeCompleteResults},), Results)
end

function clang_codeCompleteGetNumDiagnostics(Results)
    ccall((:clang_codeCompleteGetNumDiagnostics, libflint3), Cuint, (Ptr{CXCodeCompleteResults},), Results)
end

function clang_codeCompleteGetDiagnostic(Results, Index)
    ccall((:clang_codeCompleteGetDiagnostic, libflint3), CXDiagnostic, (Ptr{CXCodeCompleteResults}, Cuint), Results, Index)
end

function clang_codeCompleteGetContexts(Results)
    ccall((:clang_codeCompleteGetContexts, libflint3), Culonglong, (Ptr{CXCodeCompleteResults},), Results)
end

function clang_codeCompleteGetContainerKind(Results, IsIncomplete)
    ccall((:clang_codeCompleteGetContainerKind, libflint3), CXCursorKind, (Ptr{CXCodeCompleteResults}, Ptr{Cuint}), Results, IsIncomplete)
end

function clang_codeCompleteGetContainerUSR(Results)
    ccall((:clang_codeCompleteGetContainerUSR, libflint3), CXString, (Ptr{CXCodeCompleteResults},), Results)
end

function clang_codeCompleteGetObjCSelector(Results)
    ccall((:clang_codeCompleteGetObjCSelector, libflint3), CXString, (Ptr{CXCodeCompleteResults},), Results)
end

function clang_getClangVersion()
    ccall((:clang_getClangVersion, libflint3), CXString, ())
end

function clang_toggleCrashRecovery(isEnabled)
    ccall((:clang_toggleCrashRecovery, libflint3), Cvoid, (Cuint,), isEnabled)
end

# typedef void ( * CXInclusionVisitor ) ( CXFile included_file , CXSourceLocation * inclusion_stack , unsigned include_len , CXClientData client_data )
const CXInclusionVisitor = Ptr{Cvoid}

function clang_getInclusions(tu, visitor, client_data)
    ccall((:clang_getInclusions, libflint3), Cvoid, (CXTranslationUnit, CXInclusionVisitor, CXClientData), tu, visitor, client_data)
end

@cenum CXEvalResultKind::UInt32 begin
    CXEval_Int = 1
    CXEval_Float = 2
    CXEval_ObjCStrLiteral = 3
    CXEval_StrLiteral = 4
    CXEval_CFStr = 5
    CXEval_Other = 6
    CXEval_UnExposed = 0
end

const CXEvalResult = Ptr{Cvoid}

function clang_Cursor_Evaluate(C)
    ccall((:clang_Cursor_Evaluate, libflint3), CXEvalResult, (CXCursor,), C)
end

function clang_EvalResult_getKind(E)
    ccall((:clang_EvalResult_getKind, libflint3), CXEvalResultKind, (CXEvalResult,), E)
end

function clang_EvalResult_getAsInt(E)
    ccall((:clang_EvalResult_getAsInt, libflint3), Cint, (CXEvalResult,), E)
end

function clang_EvalResult_getAsLongLong(E)
    ccall((:clang_EvalResult_getAsLongLong, libflint3), Clonglong, (CXEvalResult,), E)
end

function clang_EvalResult_isUnsignedInt(E)
    ccall((:clang_EvalResult_isUnsignedInt, libflint3), Cuint, (CXEvalResult,), E)
end

function clang_EvalResult_getAsUnsigned(E)
    ccall((:clang_EvalResult_getAsUnsigned, libflint3), Culonglong, (CXEvalResult,), E)
end

function clang_EvalResult_getAsDouble(E)
    ccall((:clang_EvalResult_getAsDouble, libflint3), Cdouble, (CXEvalResult,), E)
end

function clang_EvalResult_getAsStr(E)
    ccall((:clang_EvalResult_getAsStr, libflint3), Ptr{Cchar}, (CXEvalResult,), E)
end

function clang_EvalResult_dispose(E)
    ccall((:clang_EvalResult_dispose, libflint3), Cvoid, (CXEvalResult,), E)
end

const CXRemapping = Ptr{Cvoid}

function clang_getRemappings(path)
    ccall((:clang_getRemappings, libflint3), CXRemapping, (Ptr{Cchar},), path)
end

function clang_getRemappingsFromFileList(filePaths, numFiles)
    ccall((:clang_getRemappingsFromFileList, libflint3), CXRemapping, (Ptr{Ptr{Cchar}}, Cuint), filePaths, numFiles)
end

function clang_remap_getNumFiles(arg1)
    ccall((:clang_remap_getNumFiles, libflint3), Cuint, (CXRemapping,), arg1)
end

function clang_remap_getFilenames(arg1, index, original, transformed)
    ccall((:clang_remap_getFilenames, libflint3), Cvoid, (CXRemapping, Cuint, Ptr{CXString}, Ptr{CXString}), arg1, index, original, transformed)
end

function clang_remap_dispose(arg1)
    ccall((:clang_remap_dispose, libflint3), Cvoid, (CXRemapping,), arg1)
end

@cenum CXVisitorResult::UInt32 begin
    CXVisit_Break = 0
    CXVisit_Continue = 1
end

struct CXCursorAndRangeVisitor
    context::Ptr{Cvoid}
    visit::Ptr{Cvoid}
end

@cenum CXResult::UInt32 begin
    CXResult_Success = 0
    CXResult_Invalid = 1
    CXResult_VisitBreak = 2
end

function clang_findReferencesInFile(cursor, file, visitor)
    ccall((:clang_findReferencesInFile, libflint3), CXResult, (CXCursor, CXFile, CXCursorAndRangeVisitor), cursor, file, visitor)
end

function clang_findIncludesInFile(TU, file, visitor)
    ccall((:clang_findIncludesInFile, libflint3), CXResult, (CXTranslationUnit, CXFile, CXCursorAndRangeVisitor), TU, file, visitor)
end

const CXIdxClientFile = Ptr{Cvoid}

const CXIdxClientEntity = Ptr{Cvoid}

const CXIdxClientContainer = Ptr{Cvoid}

const CXIdxClientASTFile = Ptr{Cvoid}

struct CXIdxLoc
    ptr_data::NTuple{2, Ptr{Cvoid}}
    int_data::Cuint
end

struct CXIdxIncludedFileInfo
    hashLoc::CXIdxLoc
    filename::Ptr{Cchar}
    file::CXFile
    isImport::Cint
    isAngled::Cint
    isModuleImport::Cint
end

struct CXIdxImportedASTFileInfo
    file::CXFile
    _module::CXModule
    loc::CXIdxLoc
    isImplicit::Cint
end

@cenum CXIdxEntityKind::UInt32 begin
    CXIdxEntity_Unexposed = 0
    CXIdxEntity_Typedef = 1
    CXIdxEntity_Function = 2
    CXIdxEntity_Variable = 3
    CXIdxEntity_Field = 4
    CXIdxEntity_EnumConstant = 5
    CXIdxEntity_ObjCClass = 6
    CXIdxEntity_ObjCProtocol = 7
    CXIdxEntity_ObjCCategory = 8
    CXIdxEntity_ObjCInstanceMethod = 9
    CXIdxEntity_ObjCClassMethod = 10
    CXIdxEntity_ObjCProperty = 11
    CXIdxEntity_ObjCIvar = 12
    CXIdxEntity_Enum = 13
    CXIdxEntity_Struct = 14
    CXIdxEntity_Union = 15
    CXIdxEntity_CXXClass = 16
    CXIdxEntity_CXXNamespace = 17
    CXIdxEntity_CXXNamespaceAlias = 18
    CXIdxEntity_CXXStaticVariable = 19
    CXIdxEntity_CXXStaticMethod = 20
    CXIdxEntity_CXXInstanceMethod = 21
    CXIdxEntity_CXXConstructor = 22
    CXIdxEntity_CXXDestructor = 23
    CXIdxEntity_CXXConversionFunction = 24
    CXIdxEntity_CXXTypeAlias = 25
    CXIdxEntity_CXXInterface = 26
    CXIdxEntity_CXXConcept = 27
end

@cenum CXIdxEntityLanguage::UInt32 begin
    CXIdxEntityLang_None = 0
    CXIdxEntityLang_C = 1
    CXIdxEntityLang_ObjC = 2
    CXIdxEntityLang_CXX = 3
    CXIdxEntityLang_Swift = 4
end

@cenum CXIdxEntityCXXTemplateKind::UInt32 begin
    CXIdxEntity_NonTemplate = 0
    CXIdxEntity_Template = 1
    CXIdxEntity_TemplatePartialSpecialization = 2
    CXIdxEntity_TemplateSpecialization = 3
end

@cenum CXIdxAttrKind::UInt32 begin
    CXIdxAttr_Unexposed = 0
    CXIdxAttr_IBAction = 1
    CXIdxAttr_IBOutlet = 2
    CXIdxAttr_IBOutletCollection = 3
end

struct CXIdxAttrInfo
    kind::CXIdxAttrKind
    cursor::CXCursor
    loc::CXIdxLoc
end

struct CXIdxEntityInfo
    kind::CXIdxEntityKind
    templateKind::CXIdxEntityCXXTemplateKind
    lang::CXIdxEntityLanguage
    name::Ptr{Cchar}
    USR::Ptr{Cchar}
    cursor::CXCursor
    attributes::Ptr{Ptr{CXIdxAttrInfo}}
    numAttributes::Cuint
end

struct CXIdxContainerInfo
    cursor::CXCursor
end

struct CXIdxIBOutletCollectionAttrInfo
    attrInfo::Ptr{CXIdxAttrInfo}
    objcClass::Ptr{CXIdxEntityInfo}
    classCursor::CXCursor
    classLoc::CXIdxLoc
end

@cenum CXIdxDeclInfoFlags::UInt32 begin
    CXIdxDeclFlag_Skipped = 1
end

struct CXIdxDeclInfo
    entityInfo::Ptr{CXIdxEntityInfo}
    cursor::CXCursor
    loc::CXIdxLoc
    semanticContainer::Ptr{CXIdxContainerInfo}
    lexicalContainer::Ptr{CXIdxContainerInfo}
    isRedeclaration::Cint
    isDefinition::Cint
    isContainer::Cint
    declAsContainer::Ptr{CXIdxContainerInfo}
    isImplicit::Cint
    attributes::Ptr{Ptr{CXIdxAttrInfo}}
    numAttributes::Cuint
    flags::Cuint
end

@cenum CXIdxObjCContainerKind::UInt32 begin
    CXIdxObjCContainer_ForwardRef = 0
    CXIdxObjCContainer_Interface = 1
    CXIdxObjCContainer_Implementation = 2
end

struct CXIdxObjCContainerDeclInfo
    declInfo::Ptr{CXIdxDeclInfo}
    kind::CXIdxObjCContainerKind
end

struct CXIdxBaseClassInfo
    base::Ptr{CXIdxEntityInfo}
    cursor::CXCursor
    loc::CXIdxLoc
end

struct CXIdxObjCProtocolRefInfo
    protocol::Ptr{CXIdxEntityInfo}
    cursor::CXCursor
    loc::CXIdxLoc
end

struct CXIdxObjCProtocolRefListInfo
    protocols::Ptr{Ptr{CXIdxObjCProtocolRefInfo}}
    numProtocols::Cuint
end

struct CXIdxObjCInterfaceDeclInfo
    containerInfo::Ptr{CXIdxObjCContainerDeclInfo}
    superInfo::Ptr{CXIdxBaseClassInfo}
    protocols::Ptr{CXIdxObjCProtocolRefListInfo}
end

struct CXIdxObjCCategoryDeclInfo
    containerInfo::Ptr{CXIdxObjCContainerDeclInfo}
    objcClass::Ptr{CXIdxEntityInfo}
    classCursor::CXCursor
    classLoc::CXIdxLoc
    protocols::Ptr{CXIdxObjCProtocolRefListInfo}
end

struct CXIdxObjCPropertyDeclInfo
    declInfo::Ptr{CXIdxDeclInfo}
    getter::Ptr{CXIdxEntityInfo}
    setter::Ptr{CXIdxEntityInfo}
end

struct CXIdxCXXClassDeclInfo
    declInfo::Ptr{CXIdxDeclInfo}
    bases::Ptr{Ptr{CXIdxBaseClassInfo}}
    numBases::Cuint
end

@cenum CXIdxEntityRefKind::UInt32 begin
    CXIdxEntityRef_Direct = 1
    CXIdxEntityRef_Implicit = 2
end

@cenum CXSymbolRole::UInt32 begin
    CXSymbolRole_None = 0
    CXSymbolRole_Declaration = 1
    CXSymbolRole_Definition = 2
    CXSymbolRole_Reference = 4
    CXSymbolRole_Read = 8
    CXSymbolRole_Write = 16
    CXSymbolRole_Call = 32
    CXSymbolRole_Dynamic = 64
    CXSymbolRole_AddressOf = 128
    CXSymbolRole_Implicit = 256
end

struct CXIdxEntityRefInfo
    kind::CXIdxEntityRefKind
    cursor::CXCursor
    loc::CXIdxLoc
    referencedEntity::Ptr{CXIdxEntityInfo}
    parentEntity::Ptr{CXIdxEntityInfo}
    container::Ptr{CXIdxContainerInfo}
    role::CXSymbolRole
end

struct IndexerCallbacks
    abortQuery::Ptr{Cvoid}
    diagnostic::Ptr{Cvoid}
    enteredMainFile::Ptr{Cvoid}
    ppIncludedFile::Ptr{Cvoid}
    importedASTFile::Ptr{Cvoid}
    startedTranslationUnit::Ptr{Cvoid}
    indexDeclaration::Ptr{Cvoid}
    indexEntityReference::Ptr{Cvoid}
end

function clang_index_isEntityObjCContainerKind(arg1)
    ccall((:clang_index_isEntityObjCContainerKind, libflint3), Cint, (CXIdxEntityKind,), arg1)
end

function clang_index_getObjCContainerDeclInfo(arg1)
    ccall((:clang_index_getObjCContainerDeclInfo, libflint3), Ptr{CXIdxObjCContainerDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

function clang_index_getObjCInterfaceDeclInfo(arg1)
    ccall((:clang_index_getObjCInterfaceDeclInfo, libflint3), Ptr{CXIdxObjCInterfaceDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

function clang_index_getObjCCategoryDeclInfo(arg1)
    ccall((:clang_index_getObjCCategoryDeclInfo, libflint3), Ptr{CXIdxObjCCategoryDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

function clang_index_getObjCProtocolRefListInfo(arg1)
    ccall((:clang_index_getObjCProtocolRefListInfo, libflint3), Ptr{CXIdxObjCProtocolRefListInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

function clang_index_getObjCPropertyDeclInfo(arg1)
    ccall((:clang_index_getObjCPropertyDeclInfo, libflint3), Ptr{CXIdxObjCPropertyDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

function clang_index_getIBOutletCollectionAttrInfo(arg1)
    ccall((:clang_index_getIBOutletCollectionAttrInfo, libflint3), Ptr{CXIdxIBOutletCollectionAttrInfo}, (Ptr{CXIdxAttrInfo},), arg1)
end

function clang_index_getCXXClassDeclInfo(arg1)
    ccall((:clang_index_getCXXClassDeclInfo, libflint3), Ptr{CXIdxCXXClassDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

function clang_index_getClientContainer(arg1)
    ccall((:clang_index_getClientContainer, libflint3), CXIdxClientContainer, (Ptr{CXIdxContainerInfo},), arg1)
end

function clang_index_setClientContainer(arg1, arg2)
    ccall((:clang_index_setClientContainer, libflint3), Cvoid, (Ptr{CXIdxContainerInfo}, CXIdxClientContainer), arg1, arg2)
end

function clang_index_getClientEntity(arg1)
    ccall((:clang_index_getClientEntity, libflint3), CXIdxClientEntity, (Ptr{CXIdxEntityInfo},), arg1)
end

function clang_index_setClientEntity(arg1, arg2)
    ccall((:clang_index_setClientEntity, libflint3), Cvoid, (Ptr{CXIdxEntityInfo}, CXIdxClientEntity), arg1, arg2)
end

const CXIndexAction = Ptr{Cvoid}

function clang_IndexAction_create(CIdx)
    ccall((:clang_IndexAction_create, libflint3), CXIndexAction, (CXIndex,), CIdx)
end

function clang_IndexAction_dispose(arg1)
    ccall((:clang_IndexAction_dispose, libflint3), Cvoid, (CXIndexAction,), arg1)
end

@cenum CXIndexOptFlags::UInt32 begin
    CXIndexOpt_None = 0
    CXIndexOpt_SuppressRedundantRefs = 1
    CXIndexOpt_IndexFunctionLocalSymbols = 2
    CXIndexOpt_IndexImplicitTemplateInstantiations = 4
    CXIndexOpt_SuppressWarnings = 8
    CXIndexOpt_SkipParsedBodiesInSession = 16
end

function clang_indexSourceFile(arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)
    ccall((:clang_indexSourceFile, libflint3), Cint, (CXIndexAction, CXClientData, Ptr{IndexerCallbacks}, Cuint, Cuint, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Cint, Ptr{CXUnsavedFile}, Cuint, Ptr{CXTranslationUnit}, Cuint), arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)
end

function clang_indexSourceFileFullArgv(arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)
    ccall((:clang_indexSourceFileFullArgv, libflint3), Cint, (CXIndexAction, CXClientData, Ptr{IndexerCallbacks}, Cuint, Cuint, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Cint, Ptr{CXUnsavedFile}, Cuint, Ptr{CXTranslationUnit}, Cuint), arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)
end

function clang_indexTranslationUnit(arg1, client_data, index_callbacks, index_callbacks_size, index_options, arg6)
    ccall((:clang_indexTranslationUnit, libflint3), Cint, (CXIndexAction, CXClientData, Ptr{IndexerCallbacks}, Cuint, Cuint, CXTranslationUnit), arg1, client_data, index_callbacks, index_callbacks_size, index_options, arg6)
end

function clang_indexLoc_getFileLocation(loc, indexFile, file, line, column, offset)
    ccall((:clang_indexLoc_getFileLocation, libflint3), Cvoid, (CXIdxLoc, Ptr{CXIdxClientFile}, Ptr{CXFile}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), loc, indexFile, file, line, column, offset)
end

function clang_indexLoc_getCXSourceLocation(loc)
    ccall((:clang_indexLoc_getCXSourceLocation, libflint3), CXSourceLocation, (CXIdxLoc,), loc)
end

# typedef enum CXVisitorResult ( * CXFieldVisitor ) ( CXCursor C , CXClientData client_data )
const CXFieldVisitor = Ptr{Cvoid}

function clang_Type_visitFields(T, visitor, client_data)
    ccall((:clang_Type_visitFields, libflint3), Cuint, (CXType, CXFieldVisitor, CXClientData), T, visitor, client_data)
end

const CXRewriter = Ptr{Cvoid}

function clang_CXRewriter_create(TU)
    ccall((:clang_CXRewriter_create, libflint3), CXRewriter, (CXTranslationUnit,), TU)
end

function clang_CXRewriter_insertTextBefore(Rew, Loc, Insert)
    ccall((:clang_CXRewriter_insertTextBefore, libflint3), Cvoid, (CXRewriter, CXSourceLocation, Ptr{Cchar}), Rew, Loc, Insert)
end

function clang_CXRewriter_replaceText(Rew, ToBeReplaced, Replacement)
    ccall((:clang_CXRewriter_replaceText, libflint3), Cvoid, (CXRewriter, CXSourceRange, Ptr{Cchar}), Rew, ToBeReplaced, Replacement)
end

function clang_CXRewriter_removeText(Rew, ToBeRemoved)
    ccall((:clang_CXRewriter_removeText, libflint3), Cvoid, (CXRewriter, CXSourceRange), Rew, ToBeRemoved)
end

function clang_CXRewriter_overwriteChangedFiles(Rew)
    ccall((:clang_CXRewriter_overwriteChangedFiles, libflint3), Cint, (CXRewriter,), Rew)
end

function clang_CXRewriter_writeMainFileToStdOut(Rew)
    ccall((:clang_CXRewriter_writeMainFileToStdOut, libflint3), Cvoid, (CXRewriter,), Rew)
end

function clang_CXRewriter_dispose(Rew)
    ccall((:clang_CXRewriter_dispose, libflint3), Cvoid, (CXRewriter,), Rew)
end

# Skipping MacroDefinition: LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN _Pragma ( "clang diagnostic push" ) _Pragma ( "clang diagnostic error \"-Wstrict-prototypes\"" )

# Skipping MacroDefinition: LLVM_CLANG_C_STRICT_PROTOTYPES_END _Pragma ( "clang diagnostic pop" )

const LLVM_CLANG_C_EXTERN_C_BEGIN = LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN

const LLVM_CLANG_C_EXTERN_C_END = LLVM_CLANG_C_STRICT_PROTOTYPES_END

const CINDEX_VERSION_MAJOR = 0

const CINDEX_VERSION_MINOR = 63

const CINDEX_VERSION = CINDEX_VERSION_ENCODE(CINDEX_VERSION_MAJOR, CINDEX_VERSION_MINOR)

const CINDEX_VERSION_STRING = CINDEX_VERSION_STRINGIZE(CINDEX_VERSION_MAJOR, CINDEX_VERSION_MINOR)

const CINDEX_LINKAGE = __declspec(dllimport)

# Skipping MacroDefinition: CINDEX_DEPRECATED __attribute__ ( ( deprecated ) )

# exports
const PREFIXES = ["flint3_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
