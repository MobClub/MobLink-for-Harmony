import AbilityStage from '@ohos.app.ability.AbilityStage';
import { promptAction, router } from '@kit.ArkUI';
import { ZztSDK } from '@zztsdk/zztcore';
import mobLink from '@zztsdk/moblink';
import utils from './Utils/utils';


export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    ZztSDK.init(this.context, "moba6b6c6d6", "b89d2427a3bc7ad1aea1e1e8c1d36bf3")
    ZztSDK.submitPolicyGrantResult(true)
    mobLink.init(this.context)
    let receiver: mobLink.RestoreSceneListener = {
      completeRestore: (scene: mobLink.Scene) => {
        let obj = this.parseMap(scene.params)
        let message = "path:" + scene.path + ",params:" + JSON.stringify(obj)
        this.showMessage("completeRestore,scene:" + message)
        if (scene) {
          console.log("scene path:" + scene.path)
          let action = scene.path
          utils.doJumpPage(action)
        }
      },
      notFoundScene: (scene: mobLink.Scene) => {
        let obj = this.parseMap(scene.params)
        let message = "path:" + scene.path + ",params:" + JSON.stringify(obj)
        this.showMessage("notFoundScene,scene:" + message)
      }
    }
    mobLink.setRestoreSceneListener(receiver)
  }

  showMessage(message: string) {
    console.log(message)
    promptAction.showToast({
      message: message,
      duration: 2000
    });
  }

  parseMap(map: Map<string, Object>): object {
    let obj: Record<string, Object> = {};
    map.forEach((value, key) => {
      if (key != undefined && value != undefined) {
        obj[key] = value;
      }
    })
    return obj;
  }
}