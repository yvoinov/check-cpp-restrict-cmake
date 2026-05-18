# --- Detect support for C++ restrict-like keywords ---
include(CheckCXXSourceCompiles)

function(check_cpp_restrict)

  set(CPP_RESTRICT "")

  foreach(cxx_kw __restrict__ __restrict)

    set(CMAKE_REQUIRED_QUIET TRUE)

    check_cxx_source_compiles(
      "
      void foo(int* ${cxx_kw} p)
      {
        *p = 42;
      }

      int main()
      {
        int x = 0;
        foo(&x);
        return 0;
      }
      "
      CXX_RESTRICT_${cxx_kw}
    )

    if(CXX_RESTRICT_${cxx_kw})
      set(CPP_RESTRICT "${cxx_kw}")
      break()
    endif()

  endforeach()

  set(CPP_RESTRICT "${CPP_RESTRICT}" PARENT_SCOPE)

endfunction()
