# Music Live
> 2023 © MaoHuPi

## 簡述
* 使用音樂與預錄影片來建立自動化音樂直播

## 格式 與 副檔名
* 影片 `.webm` 或 `.mp4` (`.webm`置入loop資料夾後，需執行`loopsConvert.sh`來轉換成`.mp4`)
* 音樂 `.wav`

## 使用
1. 將影片及音樂置入loop資料夾下
2. 將live.sh的rtmp變數設定成自己的「{串流平台}/{串流金鑰}」
3. 在musicLive資料夾下執行「`chmod +x *.sh`」
4. (影片若為`.webm` => 在musicLive資料夾下執行「`./loopsConvert.sh`」)
5. 在musicLive資料夾下執行「`./live.sh`」

## 備註
* 建議另租遠端伺服器來直播，因為使用個人電腦無法確保穩定度
