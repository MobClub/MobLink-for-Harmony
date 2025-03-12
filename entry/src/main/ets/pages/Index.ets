import mobLink from '@zztsdk/moblink';
import { promptAction } from '@kit.ArkUI';
import deviceInfo from '@ohos.deviceInfo';
import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common, Want } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = 'MobLink Demo';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      Button("getLinkId")
        .onClick(async () => {
          mobLink.init(getContext(this))
          let sc = new mobLink.Scene()
          sc.path = "/linkDemo"
          sc.params.set("testKey", "testValue")
          let receiver: mobLink.MobIDListener = {
            onResult: (mobid: string) => {
              console.log("mobId:" + mobid)
              promptAction.showToast({
                message: "mobId:" + mobid,
                duration: 2000
              });
            },
            onError: (e: Error) => {

            }
          }
          mobLink.getMobID(sc, receiver)
        }).width('90%')
        .margin(10)
        .padding(15)

      Button("跳转测试页面A")
        .onClick(async () => {
          let want: Want = {
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.mob.moblink.hosnext.demo',
            abilityName: 'EntryAbilityA',
            moduleName: 'entry', // moduleName非必选
          };
          let context = getContext(this) as common.UIAbilityContext;
          context.startAbility(want)
        })
        .width('90%')
        .margin(10)
        .padding(15)

      Button("跳转测试页面B")
        .onClick(() => {
          let want: Want = {
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.mob.moblink.hosnext.demo',
            abilityName: 'EntryAbilityB',
            moduleName: 'entry', // moduleName非必选
          };
          let context = getContext(this) as common.UIAbilityContext;
          context.startAbility(want)
        })
        .width('90%')
        .margin(10)
        .padding(15)
    }
    .height('100%')
    .width('100%')
  }
}

