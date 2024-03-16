//
// Created by innerviewer on 2024-03-14.
//

#include <Utils/Debug.h>
#include <Utils/Platform/Platform.h>
#include <Utils/Types/Thread.h>
#include <Utils/Locale/Encoding.h>

#include <Graphics/Window/Window.h>
#include <Utils/ResourceManager/ResourceManager.h>

int main(int argc, char *argv[]) {
    auto&& applicationPath = SR_PLATFORM_NS::GetApplicationPath().GetFolder();

    SR_UTILS_NS::Debug::Instance().Init(applicationPath, true, SR_UTILS_NS::Debug::Theme::Dark);
    SR_HTYPES_NS::Thread::Factory::Instance().SetMainThread();

    SR_UTILS_NS::Locale::SetLocale();

    SR_LOG("Starting application...");

/*    auto&& pWindow = new SR_GRAPH_NS::Window();
    pWindow->Initialize("Test", {1920, 1080});*/

    SR_LOG("Exiting application...");
    SR_UTILS_NS::ResourceManager::DestroySingleton();
    SR_UTILS_NS::GetSingletonManager()->DestroyAll();
    return 0;
}