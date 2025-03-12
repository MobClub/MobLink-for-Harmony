@Entry
@Component
struct PageB {
  @State message: string = 'Hello World PageB';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('PageBHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}