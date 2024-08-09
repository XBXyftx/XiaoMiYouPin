interface XMNavItem {
  title: string
  icon: ResourceStr
}

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  navList: XMNavItem[] = [
    { title: '上新精选', icon: $r('app.media.ic_xiaomi_nav_01') },
    { title: '智能家电', icon: $r('app.media.ic_xiaomi_nav_02') },
    { title: '小米众筹', icon: $r('app.media.ic_xiaomi_nav_03') },
    { title: '有品会员', icon: $r('app.media.ic_xiaomi_nav_04') },
    { title: '有品秒杀', icon: $r('app.media.ic_xiaomi_nav_05') },
    { title: '原产地', icon: $r('app.media.ic_xiaomi_nav_06') },
    { title: '生活优选', icon: $r('app.media.ic_xiaomi_nav_07') },
    { title: '手机', icon: $r('app.media.ic_xiaomi_nav_08') },
    { title: '小米自营', icon: $r('app.media.ic_xiaomi_nav_09') },
    { title: '茅台酒饮', icon: $r('app.media.ic_xiaomi_nav_10') },
    { title: '鞋服饰品', icon: $r('app.media.ic_xiaomi_nav_11') },
    { title: '家纺餐厨', icon: $r('app.media.ic_xiaomi_nav_12') },
    { title: '食品生鲜', icon: $r('app.media.ic_xiaomi_nav_13') },
    { title: '好惠买', icon: $r('app.media.ic_xiaomi_nav_14') },
    { title: '家具家装', icon: $r('app.media.ic_xiaomi_nav_15') },
    { title: '健康养生', icon: $r('app.media.ic_xiaomi_nav_16') },
    { title: '有品海购', icon: $r('app.media.ic_xiaomi_nav_17') },
    { title: '个护清洁', icon: $r('app.media.ic_xiaomi_nav_18') },
    { title: '户外运动', icon: $r('app.media.ic_xiaomi_nav_19') },
    { title: '3C数码', icon: $r('app.media.ic_xiaomi_nav_20') }
  ]

  @Builder
  DingBuBuilder() {
    //顶部
    Row({ space: 10 }) {
      Image($rawfile('ic_xiaomi_logo.png'))
        .width(40)
      Row() {
        Image($rawfile('ic_xiaomi_search.png'))
          .width(20)
        TextInput({ placeholder: '电视' })
          .backgroundColor(Color.Transparent)
          .width(180)
      }
      .backgroundColor(Color.White)
      .border({ width: 1, color: Color.Orange })
      .padding({ left: 10, right: 10 })
      .borderRadius(30)

      Blank()
      Badge({
        value: '99+', position: { x: 15 }, style: {}
      }) {
        Image($rawfile('ic_xiaomi_ring.png'))
          .width(35)
      }

    }
    .width('100%')
  }

  @Builder
  LunBoTuBuilder() {
    Swiper() {
      Image($rawfile('ic_swiper_xmyp01.jpeg'))
      Image($rawfile('ic_swiper_xmyp02.jpeg'))
      Image($rawfile('ic_swiper_xmyp03.jpeg'))
      Image($rawfile('ic_swiper_xmyp04.jpeg'))
    }
    .width('100%')
    .height(140)
    .indicator(
      Indicator.dot()
        .itemWidth(10)
        .itemHeight(4)
        .selectedItemWidth(30)
        .selectedItemHeight(4)
    )
    .autoPlay(true)
    .interval(2000) //自动轮播间隔
    .borderRadius(10)
  }

  @Builder
  DaoHangQuBuilder() {
    Column() {
      Grid(this.scroller) {
        ForEach(this.navList, (item: XMNavItem, i) => {
          GridItem() {
            Column() {
              Image(item.icon)
                .width('80%');
              Text(item.title)
                .fontSize(12);
            }
          }
          .width('20%')
        })
      }
      .width('100%')
      .height(160)
      .rowsTemplate('1fr 1fr')
      .padding({ bottom: 10 })
      .scrollBar(BarState.Off)

      ScrollBar({
        direction: ScrollBarDirection.Horizontal,
        scroller: this.scroller
      }){
        Text()
          .width(15)
          .height(5)
          .backgroundColor(Color.Orange)
          .borderRadius(40)
      }
      .borderRadius(40)
      .width(30)
      .height(5)
      .backgroundColor('#ccc')
      .margin({bottom:5})
    }
    .backgroundColor(Color.White)
    .borderRadius(10)
  }

  @Builder
  XiaoMiYouPinZong(){
    Column({ space: 10 }) {
      this.DingBuBuilder()
      this.LunBoTuBuilder()
      this.DaoHangQuBuilder()
      // 底部楼层区域
      Image($r('app.media.ic_xiaomi_floor'))
        .width('100%')
        .borderRadius(10)
    }
    .padding(10)
    .height('100%')
    .width('100%')
    .linearGradient({
      direction: GradientDirection.Bottom,
      colors: [['#ffc9c9c9', 0.5], ['#ffffffff', 1]]
    })
  }

  build() {
    //根组件
    Column(){
      this.XiaoMiYouPinZong()
    }
  }
}