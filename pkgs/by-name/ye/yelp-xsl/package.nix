{
  lib,
  stdenv,
  gettext,
  fetchurl,
  pkg-config,
  itstool,
  libxml2,
  libxslt,
  gnome,
}:

stdenv.mkDerivation rec {
  pname = "yelp-xsl";
  version = "42.1";

  src = fetchurl {
    url = "mirror://gnome/sources/yelp-xsl/${lib.versions.major version}/yelp-xsl-${version}.tar.xz";
    hash = "sha256-I4vhULFlMIDOE5lxMw/TbTomWV4NagQKLAML89IAW80=";
  };

  nativeBuildInputs = [
    pkg-config
    gettext
    itstool
    libxml2
    libxslt
  ];

  doCheck = true;

  patches = [
    ./cve-2025-3155.patch
  ];

  passthru = {
    updateScript = gnome.updateScript {
      packageName = "yelp-xsl";
    };
  };

  meta = with lib; {
    homepage = "https://gitlab.gnome.org/GNOME/yelp-xsl";
    description = "Yelp's universal stylesheets for Mallard and DocBook";
    teams = [ teams.gnome ];
    license = with licenses; [
      # See https://gitlab.gnome.org/GNOME/yelp-xsl/blob/master/COPYING
      # Stylesheets
      lgpl2Plus
      # Icons, unclear: https://gitlab.gnome.org/GNOME/yelp-xsl/issues/25
      gpl2
      # highlight.js
      bsd3
    ];
    platforms = platforms.unix;
  };
}
