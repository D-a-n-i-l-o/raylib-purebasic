#include "raylib.h"

#ifndef RAYLIB_PB_HELPER_H_INCLUDED
#define RAYLIB_PB_HELPER_H_INCLUDED

#ifdef __cplusplus
   extern “C” {
#endif



typedef void (*pbTraceLogCallback)(int logType, const char *text);
void pbhelper_RaylibTraceLogCallback(int logType, const char *text, va_list args);
void pbhelper_SetTraceLogCallback(pbTraceLogCallback p);

void pbhelper_SetWindowIcon(Image* image);
void pbhelper_GetWindowPosition(Vector2* result);
void pbhelper_BeginMode2D(Camera2D* camera);
void pbhelper_BeginMode3D(Camera3D* camera);
void pbhelper_BeginTextureMode(RenderTexture2D* target);

void pbhelper_GetMousePosition(Vector2* result);
void pbhelper_GetTouchPosition(Vector2* result, int index);

void pbhelper_GetGestureDragVector(Vector2* result);
void pbhelper_GetGesturePinchVector(Vector2* result);

void pbhelper_SetCameraMode(Camera* camera, int mode);

void pbhelper_GetMouseRay(Ray* ray, Vector2* mousePosition, Camera* camera);
void pbhelper_GetCameraMatrix(Matrix* result, Camera* camera);
void pbhelper_GetCameraMatrix2D(Matrix* result, Camera2D* camera);
void pbhelper_GetWorldToScreen(Vector2* result, Vector3* position, Camera* camera);
void pbhelper_GetWorldToScreenEx(Vector2* result, Vector3* position, Camera* camera,  int width, int height);
void pbhelper_GetWorldToScreen2D(Vector2* result, Vector2* position, Camera2D* camera);
void pbhelper_GetScreenToWorld2D(Vector2* result, Vector2* position, Camera2D* camera);

void     pbhelper_ColorNormalize(Vector4* result, int color);
long int pbhelper_ColorFromNormalized(Vector4* normalized);
void     pbhelper_ColorToHSV(Vector3* result, int color);
long int pbhelper_ColorFromHSV(Vector3* hsv);

void pbhelper_DrawPixelV(Vector2* position, Color color);

void pbhelper_DrawLineV(Vector2* startPos, Vector2* endPos, Color color);
void pbhelper_DrawLineEx(Vector2* startPos, Vector2* endPos, float thick, Color color);
void pbhelper_DrawLineBezier(Vector2* startPos, Vector2* endPos, float thick, Color color);

void pbhelper_DrawCircleSector(Vector2* center, float radius, int startAngle, int endAngle, int segments, Color color);
void pbhelper_DrawCircleSectorLines(Vector2* center, float radius, int startAngle, int endAngle, int segments, Color color);
void pbhelper_DrawCircleV(Vector2* center, float radius, Color color);

void pbhelper_DrawRing(Vector2* center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);
void pbhelper_DrawRingLines(Vector2* center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);

void pbhelper_DrawRectangleV(Vector2* position, Vector2* size, Color color);
void pbhelper_DrawRectangleRec(Rectangle* rect, Color color);
void pbhelper_DrawRectanglePro(Rectangle* rect, Vector2* origin, float rotation, Color color);
void pbhelper_DrawRectangleGradientEx(Rectangle* rect, Color col1, Color col2, Color col3, Color col4);
void pbhelper_DrawRectangleLinesEx(Rectangle* rect, int lineThick, Color color);
void pbhelper_DrawRectangleRounded(Rectangle* rect, float roundness, int segments, Color color);
void pbhelper_DrawRectangleRoundedLines(Rectangle* rect, float roundness, int segments, int lineThick, Color color);

void pbhelper_DrawTriangle(Vector2* v1, Vector2* v2, Vector2* v3, Color color);
void pbhelper_DrawTriangleLines(Vector2* v1, Vector2* v2, Vector2* v3, Color color);

void pbhelper_DrawPoly(Vector2* center, int sides, float radius, float rotation, Color color);
void pbhelper_DrawPolyLines(Vector2* center, int sides, float radius, float rotation, Color color);

bool pbhelper_CheckCollisionRecs(Rectangle* rect1, Rectangle* rect2);
bool pbhelper_CheckCollisionCircles(Vector2* center1, float radius1, Vector2* center2, float radius2);
bool pbhelper_CheckCollisionCircleRec(Vector2* center, float radius, Rectangle* rect);
void pbhelper_GetCollisionRec(Rectangle* result, Rectangle* rect1, Rectangle* rect2);
bool pbhelper_CheckCollisionPointRec(Vector2* point, Rectangle* rect);
bool pbhelper_CheckCollisionPointCircle(Vector2* point, Vector2* center, float radius);
bool pbhelper_CheckCollisionPointTriangle(Vector2* point, Vector2* p1, Vector2* p2, Vector2* p3);

void pbhelper_LoadImage(Image* image, const char *fileName);
void pbhelper_LoadImageEx(Image* image, Color *pixels, int width, int height);
void pbhelper_LoadImagePro(Image* image, void *data, int width, int height, int format);
void pbhelper_LoadImageRaw(Image* image, const char *fileName, int width, int height, int format, int headerSize);
void pbhelper_UnloadImage(Image* image);
void pbhelper_ExportImage(Image* image, const char *fileName);
void pbhelper_ExportImageAsCode(Image* image, const char *fileName);

Color   *pbhelper_GetImageData(Image* image);
Vector4 *pbhelper_GetImageDataNormalized(Image* image);

void pbhelper_GenImageColor(Image* image, int width, int height, Color color);
void pbhelper_GenImageGradientV(Image* image, int width, int height, Color top, Color bottom);
void pbhelper_GenImageGradientH(Image* image, int width, int height, Color left, Color right);
void pbhelper_GenImageGradientRadial(Image* image, int width, int height, float density, Color inner, Color outer);
void pbhelper_GenImageChecked(Image* image, int width, int height, int checksX, int checksY, Color col1, Color col2);
void pbhelper_GenImageWhiteNoise(Image* image, int width, int height, float factor);
void pbhelper_GenImagePerlinNoise(Image* image, int width, int height, int offsetX, int offsetY, float scale);
void pbhelper_GenImageCellular(Image* image, int width, int height, int tileSize);

void pbhelper_ImageCopy(Image* out_copy, Image* in_source);
void pbhelper_ImageFromImage(Image* out_image, Image* in_image, Rectangle* rect);
void pbhelper_ImageText(Image* out_image, const char *text, int fontSize, Color color);
void pbhelper_ImageTextEx(Image* out_image, Font* font, const char *text, float fontSize, float spacing, Color tint);
void pbhelper_ImageAlphaMask(Image* inout_image, Image* alphaMask);
void pbhelper_ImageCrop(Image *inout_image, Rectangle* crop);

Color* pbhelper_ImageExtractPalette(Image* in_image, int maxPaletteSize, int *extractCount);
void   pbhelper_GetImageAlphaBorder(Rectangle* out_rect, Image* in_image, float threshold);

void pbhelper_ImageDrawPixelV(Image *dst, Vector2* position, Color color);
void pbhelper_ImageDrawLineV(Image *dst, Vector2* start, Vector2* end, Color color);
void pbhelper_ImageDrawCircleV(Image *dst, Vector2* center, int radius, Color color);
void pbhelper_ImageDrawRectangleV(Image *dst, Vector2* position, Vector2* size, Color color);
void pbhelper_ImageDrawRectangleRec(Image *dst, Rectangle* rec, Color color);
void pbhelper_ImageDrawRectangleLines(Image *dst, Rectangle* rec, int thick, Color color);
void pbhelper_ImageDraw(Image *dst, Image* src, Rectangle* srcRec, Rectangle* dstRec, Color tint);
void pbhelper_ImageDrawText(Image *dst, Vector2* position, const char *text, int fontSize, Color color);
void pbhelper_ImageDrawTextEx(Image *dst, Vector2* position, Font* font, const char *text, float fontSize, float spacing, Color color);

void pbhelper_LoadTexture(Texture2D* result, const char *fileName);
void pbhelper_LoadTextureFromImage(Texture2D* result, Image* image);
void pbhelper_LoadTextureCubemap(TextureCubemap* result, Image* image, int layoutType);
void pbhelper_LoadRenderTexture(RenderTexture2D* result, int width, int height);
void pbhelper_UnloadTexture(Texture2D* texture);
void pbhelper_UnloadRenderTexture(RenderTexture2D* target);
void pbhelper_UpdateTexture(Texture2D* texture, const void *pixels);
void pbhelper_GetTextureData(Image* result, Texture2D* texture);
void pbhelper_GetScreenData(Image* result);

void pbhelper_SetTextureFilter(Texture2D* texture, int filterMode);
void pbhelper_SetTextureWrap(Texture2D* texture, int wrapMode);

void pbhelper_DrawTexture(Texture2D* texture, int posX, int posY, Color tint);
void pbhelper_DrawTextureV(Texture2D* texture, Vector2* position, Color tint);
void pbhelper_DrawTextureEx(Texture2D* texture, Vector2* position, float rotation, float scale, Color tint);
void pbhelper_DrawTextureRec(Texture2D* texture, Rectangle* sourceRec, Vector2* position, Color tint);
void pbhelper_DrawTextureQuad(Texture2D* texture, Vector2* tiling, Vector2* offset, Rectangle* quad, Color tint);
void pbhelper_DrawTexturePro(Texture2D* texture, Rectangle* sourceRec, Rectangle* destRec, Vector2* origin, float rotation, Color tint);
void pbhelper_DrawTextureNPatch(Texture2D* texture, NPatchInfo* nPatchInfo, Rectangle* destRec, Vector2* origin, float rotation, Color tint);

void pbhelper_GetFontDefault(Font* result);
void pbhelper_LoadFont(Font* result, const char *fileName);
void pbhelper_LoadFontEx(Font* result, const char *fileName, int fontSize, int *fontChars, int charsCount);
void pbhelper_LoadFontFromImage(Font* result, Image* image, Color key, int firstChar);
void pbhelper_GenImageFontAtlas(Image* result, const CharInfo *chars, Rectangle **recs, int charsCount, int fontSize, int padding, int packMethod);
void pbhelper_UnloadFont(Font* font);

void pbhelper_DrawTextEx(Font* font, const char *text, Vector2* position, float fontSize, float spacing, Color tint);
void pbhelper_DrawTextRec(Font* font, const char *text, Rectangle* rec, float fontSize, float spacing, bool wordWrap, Color tint);
void pbhelper_DrawTextRecEx(Font* font, const char *text, Rectangle* rec, float fontSize, float spacing, bool wordWrap, Color tint, int selectStart, int selectLength, Color selectTint, Color selectBackTint);
void pbhelper_DrawTextCodepoint(Font* font, int codepoint, Vector2* position, float scale, Color tint);
int  pbhelper_MeasureText(const char *text, int fontSize);
void pbhelper_MeasureTextEx(Vector2* result, Font* font, const char *text, float fontSize, float spacing);
int  pbhelper_GetGlyphIndex(Font* font, int codepoint);

void pbhelper_DrawLine3D(Vector3* startPos, Vector3* endPos, Color color);
void pbhelper_DrawPoint3D(Vector3* position, Color color);
void pbhelper_DrawCircle3D(Vector3* center, float radius, Vector3* rotationAxis, float rotationAngle, Color color);
void pbhelper_DrawCube(Vector3 *position, float width, float height, float length, Color color);
void pbhelper_DrawCubeV(Vector3* position, Vector3* size, Color color);
void pbhelper_DrawCubeWires(Vector3 *position, float width, float height, float length, Color color);
void pbhelper_DrawCubeWiresV(Vector3* position, Vector3* size, Color color);
void pbhelper_DrawCubeTexture(Texture2D* texture, Vector3* position, float width, float height, float length, Color color);
void pbhelper_DrawSphere(Vector3* centerPos, float radius, Color color);
void pbhelper_DrawSphereEx(Vector3* centerPos, float radius, int rings, int slices, Color color);
void pbhelper_DrawSphereWires(Vector3* centerPos, float radius, int rings, int slices, Color color);
void pbhelper_DrawCylinder(Vector3* position, float radiusTop, float radiusBottom, float height, int slices, Color color);
void pbhelper_DrawCylinderWires(Vector3* position, float radiusTop, float radiusBottom, float height, int slices, Color color);
void pbhelper_DrawPlane(Vector3* centerPos, Vector2* size, Color color);
void pbhelper_DrawRay(Ray* ray, Color color);
void pbhelper_DrawGizmo(Vector3* position);

void pbhelper_LoadModel(Model* result, const char *fileName);
void pbhelper_LoadModelFromMesh(Model* result, Mesh* mesh);
void pbhelper_UnloadModel(Model* model);

void pbhelper_ExportMesh(Mesh* mesh, const char *fileName);
void pbhelper_UnloadMesh(Mesh* mesh);

void pbhelper_LoadMaterialDefault(Material* result);
void pbhelper_UnloadMaterial(Material* material);
void pbhelper_SetMaterialTexture(Material* material, int mapType, Texture2D* texture);

void pbhelper_UpdateModelAnimation(Model* model, ModelAnimation* anim, int frame);
void pbhelper_UnloadModelAnimation(ModelAnimation* anim);
bool pbhelper_IsModelAnimationValid(Model* model, ModelAnimation* anim);

void pbhelper_GenMeshPoly(Mesh* result, int sides, float radius);
void pbhelper_GenMeshPlane(Mesh* result, float width, float length, int resX, int resZ);
void pbhelper_GenMeshCube(Mesh* result, float width, float height, float length);
void pbhelper_GenMeshSphere(Mesh* result, float radius, int rings, int slices);
void pbhelper_GenMeshHemiSphere(Mesh* result, float radius, int rings, int slices);
void pbhelper_GenMeshCylinder(Mesh* result, float radius, float height, int slices);
void pbhelper_GenMeshTorus(Mesh* result, float radius, float size, int radSeg, int sides);
void pbhelper_GenMeshKnot(Mesh* result, float radius, float size, int radSeg, int sides);
void pbhelper_GenMeshHeightmap(Mesh* result, Image* heightmap, Vector3* size);
void pbhelper_GenMeshCubicmap(Mesh* result, Image* cubicmap, Vector3* cubeSize);

void pbhelper_MeshBoundingBox(BoundingBox* result, Mesh* mesh);

void pbhelper_DrawModel(Model* model, Vector3* position, float scale, Color tint);
void pbhelper_DrawModelEx(Model* model, Vector3* position, Vector3* rotationAxis, float rotationAngle, Vector3* scale, Color tint);
void pbhelper_DrawModelWires(Model* model, Vector3* position, float scale, Color tint);
void pbhelper_DrawModelWiresEx(Model* model, Vector3* position, Vector3* rotationAxis, float rotationAngle, Vector3* scale, Color tint);
void pbhelper_DrawBoundingBox(BoundingBox* box, Color color);
void pbhelper_DrawBillboard(Camera* camera, Texture2D* texture, Vector3* center, float size, Color tint);
void pbhelper_DrawBillboardRec(Camera* camera, Texture2D* texture, Rectangle* sourceRec, Vector3* center, float size, Color tint);

bool pbhelper_CheckCollisionSpheres(Vector3* centerA, float radiusA, Vector3* centerB, float radiusB);
bool pbhelper_CheckCollisionBoxes(BoundingBox* box1, BoundingBox* box2);
bool pbhelper_CheckCollisionBoxSphere(BoundingBox* box, Vector3* center, float radius);
bool pbhelper_CheckCollisionRaySphere(Ray* ray, Vector3* center, float radius);
bool pbhelper_CheckCollisionRaySphereEx(Ray* ray, Vector3* center, float radius, Vector3 *collisionPoint);
bool pbhelper_CheckCollisionRayBox(Ray* ray, BoundingBox* box);
void pbhelper_GetCollisionRayModel(RayHitInfo* result, Ray* ray, Model* model);
void pbhelper_GetCollisionRayTriangle(RayHitInfo* result, Ray* ray, Vector3* p1, Vector3* p2, Vector3* p3);
void pbhelper_GetCollisionRayGround(RayHitInfo* result, Ray* ray, float groundHeight);

void pbhelper_LoadShader(Shader* result, const char *vsFileName, const char *fsFileName);
void pbhelper_LoadShaderCode(Shader* result, const char *vsCode, const char *fsCode);
void pbhelper_UnloadShader(Shader* shader);
void pbhelper_GetShaderDefault(Shader* result);
void pbhelper_GetTextureDefault(Texture2D* result);
void pbhelper_GetShapesTexture(Texture2D* result);
void pbhelper_GetShapesTextureRec(Rectangle* result);
void pbhelper_SetShapesTexture(Texture2D* texture, Rectangle* source);

int  pbhelper_GetShaderLocation(Shader* shader, const char *uniformName);
void pbhelper_SetShaderValue(Shader* shader, int uniformLoc, const void *value, int uniformType);
void pbhelper_SetShaderValueV(Shader* shader, int uniformLoc, const void *value, int uniformType, int count);
void pbhelper_SetShaderValueMatrix(Shader* shader, int uniformLoc, Matrix* mat);
void pbhelper_SetShaderValueTexture(Shader* shader, int uniformLoc, Texture2D* texture);
void pbhelper_SetMatrixProjection(Matrix* proj);
void pbhelper_SetMatrixModelview(Matrix* view);
void pbhelper_GetMatrixModelview(Matrix* result);
void pbhelper_GetMatrixProjection(Matrix* result);

void pbhelper_GenTextureCubemap(Texture2D* result, Shader* shader, Texture2D* map, int size);
void pbhelper_GenTextureIrradiance(Texture2D* result, Shader* shader, Texture2D* cubemap, int size);
void pbhelper_GenTexturePrefilter(Texture2D* result, Shader* shader, Texture2D* cubemap, int size);
void pbhelper_GenTextureBRDF(Texture2D* result, Shader* shader, int size);

void pbhelper_BeginShaderMode(Shader* shader);

void pbhelper_SetVrConfiguration(VrDeviceInfo* info, Shader* distortion);

void pbhelper_LoadWave(Wave* result, const char *fileName);
void pbhelper_LoadSound(Sound* result, const char *fileName);
void pbhelper_LoadSoundFromWave(Sound* result, Wave* wave);
void pbhelper_UpdateSound(Sound* sound, const void *data, int samplesCount);
void pbhelper_UnloadWave(Wave* wave);
void pbhelper_UnloadSound(Sound* sound);
void pbhelper_ExportWave(Wave* wave, const char *fileName);
void pbhelper_ExportWaveAsCode(Wave* wave, const char *fileName);

void pbhelper_PlaySound(Sound* sound);
void pbhelper_StopSound(Sound* sound);
void pbhelper_PauseSound(Sound* sound);
void pbhelper_ResumeSound(Sound* sound);
void pbhelper_PlaySoundMulti(Sound* sound);

bool pbhelper_IsSoundPlaying(Sound* sound);
void pbhelper_SetSoundVolume(Sound* sound, float volume);
void pbhelper_SetSoundPitch(Sound* sound, float pitch);
void pbhelper_WaveCopy(Wave* result, Wave* wave);
float* pbhelper_GetWaveData(Wave* wave);

void pbhelper_LoadMusicStream(Music* result, const char *fileName);
void pbhelper_UnloadMusicStream(Music* music);
void pbhelper_PlayMusicStream(Music* music);
void pbhelper_UpdateMusicStream(Music* music);
void pbhelper_StopMusicStream(Music* music);
void pbhelper_PauseMusicStream(Music* music);
void pbhelper_ResumeMusicStream(Music* music);
bool pbhelper_IsMusicPlaying(Music* music);
void pbhelper_SetMusicVolume(Music* music, float volume);
void pbhelper_SetMusicPitch(Music* music, float pitch);
void pbhelper_SetMusicLoopCount(Music* music, int count);
float pbhelper_GetMusicTimeLength(Music* music);
float pbhelper_GetMusicTimePlayed(Music* music);

void pbhelper_InitAudioStream(AudioStream* result, unsigned int sampleRate, unsigned int sampleSize, unsigned int channels);
void pbhelper_UpdateAudioStream(AudioStream* stream, const void *data, int samplesCount);
void pbhelper_CloseAudioStream(AudioStream* stream);
bool pbhelper_IsAudioStreamProcessed(AudioStream* stream);
void pbhelper_PlayAudioStream(AudioStream* stream);
void pbhelper_PauseAudioStream(AudioStream* stream);
void pbhelper_ResumeAudioStream(AudioStream* stream);
bool pbhelper_IsAudioStreamPlaying(AudioStream* stream);
void pbhelper_StopAudioStream(AudioStream* stream);
void pbhelper_SetAudioStreamVolume(AudioStream* stream, float volume);
void pbhelper_SetAudioStreamPitch(AudioStream* stream, float pitch);



#ifdef __cplusplus
   }
#endif

#endif /* RAYLIB_PB_HELPER_H_INCLUDED */
