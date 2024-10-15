#!/bin/bash
#
# Modify Default Config
sed -i 's/192.168.1.1/192.168.0.254/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# For Lede
sed -i 's/ntp.aliyun.com/pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/time1.cloud.tencent.com/0.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/time.ustc.edu.cn/1.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/cn.pool.ntp.org/2.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/ntp.aliyun.com/pool.ntp.org/g' package/base-files/files/bin/config_generate

# Remove Packages
rm -rf feeds/packages/net/smartdns
rm -rf feeds/packages/lang/golang

# Remove Themes
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-netgear

# Remove Applications
rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-wrtbwmon
# rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-serverchan

# Golang
git clone -b 22.x https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang

# Themes
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/ExtraPack/luci-theme-argon
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-app-argon-config package/ExtraPack/luci-app-argon-config

# Pack
git clone --depth 1 https://github.com/chenmozhijin/luci-app-socat package/ExtraPack/luci-app-socat

# HelloWorld
# git clone --depth 1 https://github.com/MilesPoupart/luci-app-vssr package/ExtraPack/luci-app-vssr

# PassWall
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/ExtraPack/luci-app-passwall
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 package/ExtraPack/luci-app-passwall2
# git clone --depth 1 -b main https://github.com/xiaorouji/openwrt-passwall-packages package/ExtraPack/openwrt-passwall-packages

# Xray
# git clone --depth 1 https://github.com/yichya/luci-app-xray package/ExtraPack/luci-app-xray
git clone --depth 1 https://github.com/honwen/luci-app-xray package/ExtraPack/luci-app-xray

# SmartDNS
git clone --depth 1 https://github.com/pymumu/openwrt-smartdns package/ExtraPack/smartdns
git clone --depth 1 -b master https://github.com/pymumu/luci-app-smartdns package/ExtraPack/luci-app-smartdns

# Netdata
git clone --depth 1 https://github.com/sirpdboy/luci-app-netdata package/ExtraPack/luci-app-netdata

# Maxmind DB
git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb package/ExtraPack/lua-maxminddb

# Bandwidth Monitor
git clone --depth 1 https://github.com/brvphoenix/wrtbwmon package/ExtraPack/wrtbwmon
git clone --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon package/ExtraPack/luci-app-wrtbwmon

# Alist
git clone --depth 1 https://github.com/alist-org/alist package/ExtraPack/alist
git clone --depth 1 https://github.com/sbwml/luci-app-alist package/ExtraPack/luci-app-alist

# DDNS Go
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go package/ExtraPack/luci-app-ddns-go

# Partition
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp package/ExtraPack/luci-app-partexp

# Auto Cron
git clone --depth 1 https://github.com/sirpdboy/luci-app-autotimeset package/ExtraPack/luci-app-autotimeset

## UnTested
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status package/ExtraPack/luci-app-cpu-status
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status-mini package/ExtraPack/luci-app-cpu-status-mini
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-perf package/ExtraPack/luci-app-cpu-perf
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-interfaces-statistics package/ExtraPack/luci-app-interfaces-statistics
# git clone --depth 1 https://github.com/DevOpenWRT-Router/luci-app-cpulimit package/ExtraPack/luci-app-cpulimit

# Customizing the LUCI Menus
## PassWall Menu
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/type/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/type/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/passwall/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/global/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/log/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/rule/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/server/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/socks_auto_switch/*.htm

## PassWall 2 Menu
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/client/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/client/type/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/server/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/server/type/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/passwall2/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/app_update/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/global/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/log/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/node_list/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/rule/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/server/*.htm
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/socks_auto_switch/*.htm

## Hello World Menu
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-vssr/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
# sed -i 's/services/vpn/g' package/ExtraPack/luci-app-vssr/luasrc/view/vssr/*.htm

# Setting Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\hub\.com/g' {}

# Install Feeds
./scripts/feeds install -a -f