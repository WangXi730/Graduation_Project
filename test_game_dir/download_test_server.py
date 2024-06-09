from fastapi import FastAPI, File, HTTPException
from fastapi.responses import FileResponse
from starlette.responses import StreamingResponse
import os

app = FastAPI()

@app.get("/download")
async def download_file():
    # 定义要下载的文件路径
    file_path = "./MineSweeping_setup2.msi"

    # 检查文件是否存在
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="File not found")

    # 返回文件
    return FileResponse(file_path, filename="MineSweeping_setup2.msi")

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=80)
