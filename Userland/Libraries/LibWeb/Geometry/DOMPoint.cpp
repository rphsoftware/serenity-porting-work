/*
 * Copyright (c) 2022, Andreas Kling <kling@serenityos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <LibWeb/Bindings/Intrinsics.h>
#include <LibWeb/Geometry/DOMPoint.h>

namespace Web::Geometry {

JS::NonnullGCPtr<DOMPoint> DOMPoint::construct_impl(JS::Realm& realm, double x, double y, double z, double w)
{
    return *realm.heap().allocate<DOMPoint>(realm, realm, x, y, z, w);
}

DOMPoint::DOMPoint(JS::Realm& realm, double x, double y, double z, double w)
    : DOMPointReadOnly(realm, x, y, z, w)
{
    set_prototype(&Bindings::cached_web_prototype(realm, "DOMPoint"));
}

DOMPoint::~DOMPoint() = default;

}
