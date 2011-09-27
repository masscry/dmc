/* ////////////////////////////////////////////////////////////////////////////
 * File:        winstl_spin_mutex.h (originally MWSpinMx.h, ::SynesisWin)
 *
 * Purpose:     Intra-process mutex, based on spin waits.
 *
 * Date:        27th August 1997
 * Updated:     11th September 2004
 *
 * Home:        http://stlsoft.org/
 *
 * Copyright (c) 2002-2004, Matthew Wilson and Synesis Software
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * - Neither the name(s) of Matthew Wilson and Synesis Software nor the names of
 *   any contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * ////////////////////////////////////////////////////////////////////////// */


/// \file winstl_spin_mutex.h
///
/// Intra-process mutex, based on spin waits.

#ifndef WINSTL_INCL_H_WINSTL_SPIN_MUTEX
#define WINSTL_INCL_H_WINSTL_SPIN_MUTEX

#ifndef __STLSOFT_DOCUMENTATION_SKIP_SECTION
# define WINSTL_VER_H_WINSTL_SPIN_MUTEX_MAJOR       2
# define WINSTL_VER_H_WINSTL_SPIN_MUTEX_MINOR       0
# define WINSTL_VER_H_WINSTL_SPIN_MUTEX_REVISION    1
# define WINSTL_VER_H_WINSTL_SPIN_MUTEX_EDIT        23
#endif /* !__STLSOFT_DOCUMENTATION_SKIP_SECTION */

/* /////////////////////////////////////////////////////////////////////////////
 * Includes
 */

#ifndef WINSTL_INCL_H_WINSTL
# include "winstl.h"                    // Include the WinSTL root header
#endif /* !WINSTL_INCL_H_WINSTL */

/* /////////////////////////////////////////////////////////////////////////////
 * Namespace
 */

#ifndef _WINSTL_NO_NAMESPACE
# if defined(_STLSOFT_NO_NAMESPACE) || \
     defined(__STLSOFT_DOCUMENTATION_SKIP_SECTION)
/* There is no stlsoft namespace, so must define ::winstl */
namespace winstl
{
# else
/* Define stlsoft::winstl_project */

namespace stlsoft
{

namespace winstl_project
{

# endif /* _STLSOFT_NO_NAMESPACE */
#endif /* !_WINSTL_NO_NAMESPACE */

/* /////////////////////////////////////////////////////////////////////////////
 * Classes
 */

// class spin_mutex
/// This class provides an implementation of the mutex model based on a spinning mechanism
class spin_mutex
{
public:
    typedef spin_mutex class_type;

// Construction
public:
    /// Creates an instance of the mutex
    ss_explicit_k spin_mutex(ws_sint32_t *p = NULL) winstl_throw_0()
        : m_spinCount((NULL != p) ? p : &m_internalCount)
        , m_internalCount(0)
#ifdef STLSOFT_SPINMUTEX_COUNT_LOCKS
        , m_cLocks(0)
#endif // STLSOFT_SPINMUTEX_COUNT_LOCKS
    {}
    /// Destroys an instance of the mutex
    ~spin_mutex() winstl_throw_0()
    {
#ifdef STLSOFT_SPINMUTEX_COUNT_LOCKS
        stlsoft_assert(m_cLocks == 0);
#endif // STLSOFT_SPINMUTEX_COUNT_LOCKS
    }

// Operations
public:
    /// Acquires a lock on the mutex, pending the thread until the lock is aquired
    void lock() winstl_throw_0()
    {
        for(; 0 != ::InterlockedExchange((LPLONG)m_spinCount, 1); ::Sleep(1))
        {}
#ifdef STLSOFT_SPINMUTEX_COUNT_LOCKS
        stlsoft_assert(++m_cLocks != 0);
#endif // STLSOFT_SPINMUTEX_COUNT_LOCKS
    }
    /// Releases an aquired lock on the mutex
    void unlock() winstl_throw_0()
    {
#ifdef STLSOFT_SPINMUTEX_COUNT_LOCKS
        stlsoft_assert(m_cLocks-- != 0);
#endif // STLSOFT_SPINMUTEX_COUNT_LOCKS
        (void)::InterlockedExchange((LPLONG)m_spinCount, 0);
    }

// Members
private:
    ws_sint32_t     *m_spinCount;
    ws_sint32_t     m_internalCount;
#ifdef STLSOFT_SPINMUTEX_COUNT_LOCKS
    ws_sint32_t     m_cLocks;       // Used as check on matched Lock/Unlock calls
#endif // STLSOFT_SPINMUTEX_COUNT_LOCKS

// Not to be implemented
private:
    spin_mutex(class_type const &rhs);
    spin_mutex &operator =(class_type const &rhs);
};

/* /////////////////////////////////////////////////////////////////////////////
 * Control shims
 */

#ifndef _WINSTL_NO_NAMESPACE
# if defined(_STLSOFT_NO_NAMESPACE) || \
     defined(__STLSOFT_DOCUMENTATION_SKIP_SECTION)
} // namespace winstl
# else
} // namespace winstl_project
# endif /* _STLSOFT_NO_NAMESPACE */
#endif /* !_WINSTL_NO_NAMESPACE */

/// \weakgroup concepts STLSoft Concepts

/// \weakgroup concepts_shims Shims
/// \ingroup concepts

/// \weakgroup concepts_shims_sync_control Synchronisation Control Shims
/// \ingroup concepts_shims
/// \brief These \ref concepts_shims "shims" control the behaviour of synchronisation objects

/// \defgroup winstl_sync_control_shims Synchronisation Control Shims (WinSTL)
/// \ingroup WinSTL concepts_shims_sync_control
/// \brief These \ref concepts_shims "shims" control the behaviour of Win32 synchronisation objects
/// @{

/// This control ref concepts_shims "shim" aquires a lock on the given mutex
///
/// \param mx The mutex on which to aquire the lock
inline void lock_instance(winstl_ns_qual(spin_mutex) &mx)
{
    mx.lock();
}

/// This control ref concepts_shims "shim" releases a lock on the given mutex
///
/// \param mx The mutex on which to release the lock
inline void unlock_instance(winstl_ns_qual(spin_mutex) &mx)
{
    mx.unlock();
}

/// @} // end of group winstl_sync_control_shims

#ifndef _WINSTL_NO_NAMESPACE
# if defined(_STLSOFT_NO_NAMESPACE) || \
     defined(__STLSOFT_DOCUMENTATION_SKIP_SECTION)
namespace winstl {
# else
namespace winstl_project {
#  if defined(__STLSOFT_COMPILER_IS_BORLAND)
using ::stlsoft::lock_instance;
using ::stlsoft::unlock_instance;
#  endif /* __STLSOFT_COMPILER_IS_BORLAND */
# endif /* _STLSOFT_NO_NAMESPACE */
#endif /* !_WINSTL_NO_NAMESPACE */

/* /////////////////////////////////////////////////////////////////////////////
 * lock_traits (for the compilers that do not support Koenig Lookup)
 */

// class lock_traits
/// Traits for the spin_mutex class (for compilers that do not support Koenig Lookup)
struct spin_mutex_lock_traits
{
public:
    /// The lockable type
    typedef spin_mutex                lock_type;
    typedef spin_mutex_lock_traits    class_type;

// Operations
public:
    /// Lock the given spin_mutex instance
    static void lock(spin_mutex &c)
    {
        lock_instance(c);
    }

    /// Unlock the given spin_mutex instance
    static void unlock(spin_mutex &c)
    {
        unlock_instance(c);
    }
};

////////////////////////////////////////////////////////////////////////////////
// Unit-testing

#ifdef STLSOFT_UNITTEST

namespace unittest
{
    ss_bool_t test_winstl_spin_mutex(unittest_reporter *r)
    {
        using stlsoft::unittest::unittest_initialiser;

        ss_bool_t               bSuccess    =   true;

        unittest_initialiser    init(r, "WinSTL", "spin_mutex", __FILE__);

#if 0
        if(<<TODO>>)
        {
            r->report("<<TODO>> failed ", __LINE__);
            bSuccess = false;
        }
#endif /* 0 */

        return bSuccess;
    }

    unittest_registrar    unittest_winstl_spin_mutex(test_winstl_spin_mutex);

} // namespace unittest

#endif /* STLSOFT_UNITTEST */

/* ////////////////////////////////////////////////////////////////////////// */

#ifndef _WINSTL_NO_NAMESPACE
# if defined(_STLSOFT_NO_NAMESPACE) || \
     defined(__STLSOFT_DOCUMENTATION_SKIP_SECTION)
} // namespace winstl
# else
} // namespace winstl_project
} // namespace stlsoft
# endif /* _STLSOFT_NO_NAMESPACE */
#endif /* !_WINSTL_NO_NAMESPACE */

/* ////////////////////////////////////////////////////////////////////////// */

#endif /* !WINSTL_INCL_H_WINSTL_SPIN_MUTEX */

/* ////////////////////////////////////////////////////////////////////////// */
