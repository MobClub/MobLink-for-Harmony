import { router } from "@kit.ArkUI";

namespace utils {
  export const pageAPaths: string[] = ["/scene/news"]

  export const pageBPaths: string[] = ["/demo/b"]

  export function doJumpPage(action: string) {
    if (action) {
      if (utils.pageAPaths.includes(action)) {
        router.pushUrl({
          url: "pages/PageA",
        })
      } else if (utils.pageBPaths.includes(action)) {
        router.pushUrl({
          url: "pages/PageB",
        })
      }else {
        console.log("unKnow Action:" + action)
      }
    }
  }
}

export default utils;